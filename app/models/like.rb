class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes
  belongs_to :post, inverse_of: :likes
  # make sure the user can only follow a post no more than once.
  validates :user_id, uniqueness: {scope: :post_id}  
end
