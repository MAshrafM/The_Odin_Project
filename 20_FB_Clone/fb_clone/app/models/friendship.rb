class Friendship < ActiveRecord::Base
  belongs_to :request_from, class_name: "User"
  belongs_to :request_to, class_name: "User"
  
  #Validations
  validates_presence_of :request_from_id, :request_to_id
  validates :request_from_id, uniqueness: { scope: :request_to_id }
end
