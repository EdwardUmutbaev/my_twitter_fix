class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = current_user.all_posts
  end
end
