class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :posts, :dependent => :destroy

  include User::OmniAuthExtension

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def current_user?(user)
    user  == current_user
  end  

  def all_posts 
    Post.find(:all, :order => "created_at DESC")
  end

  def user_posts 
    self.posts.order("created_at DESC")
  end
 
end
