require 'spec_helper'

describe User do
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:friendships).dependent(:destroy) }
  it { should have_many(:following).through(:friendships) }
  it { should have_many(:reverse_friendships).dependent(:destroy) }
  it { should have_many(:followers).through(:reverse_friendships) }

  it { should allow_mass_assignment_of(:full_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of :full_name }
  
  before :all do
    User.delete_all 
    @user = Factory(:user)
    @user_2 = Factory(:user)       
  end

  context '#follow' do 
    it 'should create friendship' do      
      @user.follow!(@user_2)
      @user.following?(@user_2).should == true  
    end
  end

  context '#unfollow' do
    it 'should destroy friendship' do
      @user.follow!(@user_2)
      @user.unfollow!(@user_2)
      @user.following?(@user_2).should == false
    end
  end

  context '#following_list' do
    it 'should return following list' do
      count = @user.following_list.count
      @user_2.follow!(@user)      
      @user.following_list.count == count+1
    end
  end

  context '#followers_list' do
    it 'should return followers list' do
      count = @user.followers_list.count
      @user_2.follow!(@user)      
      @user.followers_list.count == count+1
    end
  end

  context '#all_posts' do
    it 'should return all posts' do
      count = @user.all_posts.count
      @user_2.follow!(@user) 
      Post.create(:user_id => @user_2.id, :message => "Hello")    
      @user.all_posts.count == count+1
    end
  end
  
  context '#user_posts' do
    it 'should return user posts' do
      count = @user.user_posts.count
      Post.create(:user_id => @user.id, :message => "Hello")    
      @user.user_posts.count == count+1
    end
  end

  context '#full_name_with_email' do
    it 'should return full name with email' do
      @user.full_name_with_email.should == "test1 (test1@example.com)" # == /test\d \(test\d@example.com\)/
    end
  end

  
end
