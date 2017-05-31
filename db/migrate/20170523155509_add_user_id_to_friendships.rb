class AddUserIdToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_reference :friendships, :user, foreign_key: true
  end
end
