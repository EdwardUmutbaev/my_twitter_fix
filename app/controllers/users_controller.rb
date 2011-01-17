class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user
     @posts = @user.user_posts  
    else
     @posts = @user.all_posts
    end 
    @following = @user.following_list     
    @followers = @user.followers_list     
  end 
end
