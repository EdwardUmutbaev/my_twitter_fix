class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  include User::OmniAuthExtension

  has_many :posts, :dependent => :destroy
  has_many :friendships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :friendships, :source => :followed
  has_many :reverse_friendships, :foreign_key => "followed_id", :class_name => "Friendship", :dependent => :destroy
  has_many :followers, :through => :reverse_friendships, :source => :follower 

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def current_user?(user)
    user  == current_user
  end  

  def all_posts 
    Post.find(:all, :conditions => ["user_id in (?)", following.collect{ |followed| followed.id }.push(self.id)], :order => "created_at DESC")
  end

  def user_posts 
    self.posts.order("created_at DESC")
  end
 
  def following?(followed)
    friendships.find_by_followed_id(followed)
  end

  def follow!(followed)
    friendships.create!(:followed_id => followed.id)
  end

  def following_list
    self.following
  end

  def followers_list
    self.followers
  end

  def unfollow!(followed)
    friendships.find_by_followed_id(followed).destroy
  end 
end
