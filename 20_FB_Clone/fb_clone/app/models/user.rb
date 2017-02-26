class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # post and comments associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # Friendship associations
  has_many :requested_friendships, class_name: "Friendship", foreign_key: :request_from_id, dependent: :destroy
  has_many :friends, through: :requested_friends, source: :request_from
  has_many :received_friendships, class_name: "Friendship", foreign_key: :request_to_id, dependent: :destroy
  has_many :received_friends, through: :received_friendships, source: :request_to
  
  # likes and notifications associations
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  # Validations
  validates_presence_of :name, :last_name
end
