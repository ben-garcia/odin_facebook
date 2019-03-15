class User < ApplicationRecord
  has_many :sent_friend_requests,     class_name: "Friendship",
                                      foreign_key: "sender_id",
                                      dependent: :destroy
  has_many :received_friend_requests, class_name: "Friendship",
                                      foreign_key: "receiver_id",
                                      dependent: :destroy
  has_many :friendships
  has_many :friends,                  through: :friendships,
                                      source: :friend,
                                      dependent: :destroy
  has_many :posts
  has_many :likes,                    inverse_of: :user,    # bi directoinal assocation
                                      dependent: :destroy
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable # :trackable, :validatable

 def add_friend(new_friend)
   if !self.friends.include?(new_friend)
     self.friends << new_friend
   else
     return
   end
 end

 def friends?(friend)
   self.friends.exists?(friend.id)
 end

 def delete_friend_request(friend_request)
   self.sent_friend_requests.delete(friend_request)
 end

 def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
 end

 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end

 def password_required?
   super && provider.blank?
 end
end
