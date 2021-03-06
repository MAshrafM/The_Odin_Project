class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token

  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_save :downcase_email
  before_create :create_activation_digest
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, length: {minimum: 6}, allow_blank: true

	def remember
	  self.remember_token = User.new_token
	  update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
	  update_attribute(:remember_digest, nil)
	end

	def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
	  return false if digest.nil?
	  BCrypt::Password.new(digest).is_password?(token)
	end

  #Activate an account
  def activate
    #update_attribute(:activated, true)
    #update_attribute(:activated_at, Time.zone.now)
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  #send activation mail

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  #password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    #update_attribute(:reset_digest, User.digest(reset_token))
    #update_attribute(:reset_sent_at, Time.zone.now)
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  #send password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  #return true if password reset has expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  #define proto feed
  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  #follow a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  #unfollow a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #return true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

	class << self
	  def digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end

	  def new_token
	    SecureRandom.urlsafe_base64
	  end
	end

  private
  #converts email to lowercase

  def downcase_email
    self.email = email.downcase
  end

  #create and assign activation token and digest
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
