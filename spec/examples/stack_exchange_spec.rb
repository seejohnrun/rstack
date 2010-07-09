require File.dirname(__FILE__) + '/spec_helper'

describe StackExchange, 'badges' do

  it 'should be able to count all of the badges' do
    se = StackExchange.new(DEFAULT_API_HOST)
    se.badges.size.should_not == 0
  end

  it 'should have the right types for all badges' do
    se = StackExchange.new(DEFAULT_API_HOST)
    badge = se.badges.first
    # check
    badge.badge_id.should be_an(Integer)
    badge.rank.should be_a(String)
    badge.name.should be_a(String)
    badge.description.should be_a(String)
    badge.award_count.should be_a(Integer)
    [false, true].should include(badge.tag_based)
    badge.badges_recipients_url.should be_a(String)
  end
  
end

describe StackExchange, 'moderators' do

  it 'should be able to count all of the site moderators' do
    se = StackExchange.new(DEFAULT_API_HOST)
    se.moderators.size.should_not == 0
  end

  it 'should be able to filter user names on a moderator request' do
    se = StackExchange.new(DEFAULT_API_HOST)
    moderators = se.moderators(:filter => 'a')
    moderators.size.should_not == 0 # make sure we don't shortcut the test
    moderators.each do |user|
      # each returned user should have 'john' in their display name
      user.display_name.downcase.include?('a').should be(true)
    end
  end
  
end
