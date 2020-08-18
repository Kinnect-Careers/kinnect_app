require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:most_recent)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Skill.count' do
      post skills_path, params: { 
        skill: { 
          title: "Skill Example",
          descriptor: "Descriptor Example"
        }
      }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Skill.count' do
      delete skill_path(@skill)
    end
    assert_redirected_to login_url
  end
end
