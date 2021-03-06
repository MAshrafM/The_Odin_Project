class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post
  
  validates :body,  presence: true, length: { maximum: 1000 }
  validates_presence_of :user_id, :post_id
end
