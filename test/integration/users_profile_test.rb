require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  setup do
    @user = users(:alex)
  end  
  
  test "profile display" do
    login_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.skills.count.to_s, response.body
    assert_select 'div.pagination'
    @user.skills.paginate(page: 1).each do |skill|
      assert_match skill.title, response.body
      assert_match skill.descriptor, response.body
    end
    
    # assert_match @user.experiences.count.to_s, response.body
    # @user.experiences.paginate(page: 1).each do |experience|
    #   assert_match experience.title, response.body
    #   assert_match experience.descriptor, response.body
    # end
  end
end