class Post < ApplicationRecord
  belongs_to :author,           class_name: "User",
                                foreign_key: "user_id"
  has_many :likes,              inverse_of: :post,    # bi directional assocation.
                                dependent: :destroy
  has_many :comments
end
