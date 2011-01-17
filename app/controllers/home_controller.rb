class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = current_user.all_posts
    @user = current_user
    @following = @user.following
    @following_count = @following.size
    @followers = @user.followers
    @followers_count = @followers.size
  end
end
