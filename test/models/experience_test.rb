require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  
  setup do
    @experience = experiences(:experience_0)
  end
  
  test "should be valid" do
    assert @experience.valid?
  end
  
  test "should have user id" do
    @experience.user_id = nil
    assert_not @experience.valid?
  end
  
  test "should have start time set" do
    @experience.started_at = nil
    assert_not @experience.valid?
  end
  
  test "should have current as true when ended_at is not set and the opposite otherwise" do
    assert_not @experience.current
    @experience.ended_at = nil
    @experience.save
    assert @experience.current
  end
  
  test "company should have name less than 100 chars" do
    @experience.company = "j" * 101
    assert_not @experience.valid?
  end
  
  test "order should be the most recent experience first" do
    assert_equal experiences(:experience_3), users(:jessie).experiences.first
    assert_equal experiences(:experience_0), users(:alex).experiences.first
  end
end
