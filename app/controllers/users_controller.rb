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
  end 
end
