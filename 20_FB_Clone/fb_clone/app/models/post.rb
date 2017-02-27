class Post < ActiveRecord::Base
  has_attached_file :post_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/
  
  validates_presence_of :body
  validates_presence_of :user_id
  validates :body, length: { maximum: 1000 }
  
end
