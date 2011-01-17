class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :message
  validates :message, :length => { :minimum => 2, :maximum => 140 }

  delegate :full_name, :avatar, :to => :user, :prefix => true
end
