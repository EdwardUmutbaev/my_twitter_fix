require 'spec_helper'

describe User do
  before :all do
    User.delete_all 
    @user = User.create(:full_name => "test", :email => "test@gmail.com", :password => "123456", :password_confirmation => "123456")
    @user_2 = User.create(:full_name => "test_1", :email => "test_1@gmail.com", :password => "123456", :password_confirmation => "123456")      
  end

  describe "follow" do 
    it "should create friendship" do       
      @user.follow!(@user_2)
      @user.following?(@user_2).should == true  
    end
  end

  describe "unfollow" do
    it "should destroy friendship" do
      @user.follow!(@user_2)
      @user.unfollow!(@user_2)
      @user.following?(@user_2).should == false
    end
  end

  describe "following_list" do
    it "should return following list" do
      count = @user.following_list.count
      @user_2.follow!(@user)      
      @user.following_list.count == count+1
    end
  end

  describe "followers_list" do
    it "should return followers list" do
      count = @user.followers_list.count
      @user_2.follow!(@user)      
      @user.followers_list.count == count+1
    end
  end

  describe "all_posts" do
    it "should return all posts" do
      count = @user.all_posts.count
      @user_2.follow!(@user) 
      Post.create(:user_id => @user_2.id, :message => "Hello")    
      @user.all_posts.count == count+1
    end
  end
  
  describe "user_posts" do
    it "should return user posts" do
      count = @user.user_posts.count
      Post.create(:user_id => @user.id, :message => "Hello")    
      @user.user_posts.count == count+1
    end
  end

  describe "full_name_with_email" do
    it "should return full name with email" do
      @user.full_name_with_email.should == "test (test@gmail.com)"
    end
  end

  it { should allow_mass_assignment_of(:full_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of :full_name }
end
