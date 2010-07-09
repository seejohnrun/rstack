require File.dirname(__FILE__) + '/spec_helper'

describe User do

  before(:all) do
    se = StackExchange.new(DEFAULT_API_HOST)
    @user = se.moderators.first
  end
  
  it 'user should have a display_name' do
  end
  
end

describe User, 'find' do

  before(:all) do
    @se = StackExchange.new(DEFAULT_API_HOST)
  end
    
  it 'should be able to look a user up' do
    user1 = @se.moderators.first
    user2 = User.find(@se, user1.user_id)
    user2.should == user2
  end

  it 'should be able to look up multiple users' do
    moderators = @se.moderators :pagesize => 10
    moderator_ids = moderators.map { |m| m.user_id }
    moderators2 = User.find(@se, moderator_ids)
    moderators.sort.should == moderators2.sort
  end
  
end
