require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experience = experiences(:experience_0)
  end
  
  test "should redirect create when user is not logged in" do
    assert_no_difference 'Experience.count' do
      post experiences_path, params: { experience: { company: "Lorem lorem" }}
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when user is not logged in" do
    assert_no_difference 'Experience.count' do
      delete experience_path(@experience)
    end
    assert_redirected_to login_url
  end
  
end
