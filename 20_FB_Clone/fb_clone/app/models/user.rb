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
  has_many :sent_notifications, class_name: "Notification", dependent: :destroy, foreign_key: :sender_id
  
  # Validations
  validates_presence_of :name, :last_name
  
  #Methods
   
  # show full name
  def full_name
    "#{self.name} #{self.last_name}"
  end
  
  # get all friend requests
  def get_all_requests
    User.where("id IN (SELECT request_from_id FROM friendships WHERE request_to_id = :user_id AND friends = :state)", user_id: self.id, state: false)
  end
  
  #send friend request
  def request_friendship(other_user)
    if valid_friend_request?(other_user)
      self.requested_friendships.create(request_to_id: other_user.id)
      other_user.notifications.create(sender_id: self.id, title: "request", message: "#{self.name.capitalize} #{self.last_name.capitalize} wants to be friends with you.")
    end
  end
  
  #check friendship
  def has_friendship?(other_user)
    !get_friendship(self, other_user).nil?
  end
  
  # check sent request
  def has_requested?(other_user)
    !get_request(other_user, self).nil?
  end
  
  #already requested
  def requested_to?(other_user)
    has_requested?(other_user) && get_request(other_user, self).request_from == self ? true : false
  end
  
  # friendship status
  def status
    if has_friendship?(other_user)
      return "friends"
    elsif has_requested?(other_user)
      if requested_to?(other_user)
        return "i_requested"
      else
        return "i_recieved"
      end
    end
  end
  
  # get the relation
  def get_relationship(other_user)
    get_request(other_user,self).nil? ? get_friendship(self,other_user) : get_request(other_user,self)
  end
  
  # accept a request
  def accept_friend_request(other_user)
    friendship = get_request(other_user, self)
    if friendship
      friendship.update_attributes(friends: true)
      other_user.notifications.create(sender_id: self.id, title: "accept_request", message: "You are now friends with #{self.name.capitalize} #{self.last_name.capitalize}.")
    end
  end
  
  # reject a request
  def reject_friend_request(other_user)
    friendship = get_request(other_user, self)
    if friendship
      friendship.destroy
    end
  end
  
  # delete friendship
  def delete_friendship(other_user)
    if has_friendship?(other_user)
      get_friendship(self, other_user).destroy
    end
  end
  
  # get all friends
  def get_all_friends
    User.where(
      "id IN 
      (SELECT request_to_id FROM friendships WHERE request_from_id = :user_id AND friends = :state) 
      OR id IN
      (SELECT request_from_id FROM friendships WHERE request_to_id = :user_id AND friends = :state)",
      user_id: self.id, state: true
    )
  end
  
  # get feed
  def feed
    Post.where(
      "user_id IN 
      (SELECT request_to_id FROM friendships WHERE request_from_id = :user_id AND friends = :state)
      OR user_id IN
      (SELECT request_from_id FROM friendships WHERE request_to_id = :user_id AND friends = :state)
      OR user_id = :user_id",
      user_id: self.id, state: true
    ).order(created_at: :desc)
      
  end
  
  private
  
  # return the request that from made to to
  def get_request(from, to)
    from.requested_friendships.find_by(request_to_id: to.id, friends: false) || to.requested_friendships.find_by(request_to_id: from.id, friends: false)
  end
  
  # return relation with current friendship
  def get_friendship(current_user, other_user)
    current_user.requested_friendships.find_by(request_to_id: other_user.id, friends: true) ||
      other_user.requested_friendships.find_by(request_to_id: current_user.id, friends: true)
  end
  
  # check if they are friend or if the request hasnt been sent
  def valid_friend_request?(other_user)
    get_friendship(self, other_user).nil? && get_request(other_user, self).nil?
  end
end
