require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  setup do
    @user = users(:alex)
    @skill = @user.skills.build(title: "Skill 1", descriptor: "Desc 1")
  end
  
  test "should be a valid skill" do
    assert @skill.valid?
  end
  
  test "user id should be present" do
    @skill.user_id = nil
    assert_not @skill.valid?
  end
  
  test "title should be present and not longer than 50 characters" do
    @skill.title = " "
    assert_not @skill.valid?
    @skill.title = "a" * 51
    assert_not @skill.valid?
  end
  
  test "order should be most recent first" do
    assert_equal skills(:most_recent), Skill.first
  end
end
