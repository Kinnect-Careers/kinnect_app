require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opportunity = opportunities(:opp1)
    @another_opp = opportunities(:opp2)
    @user = users(:alex)
    @application = Application.create(
      opportunity: @opportunity, 
      user: @user
    )
  end

  test "should get index" do
    get applications_url
    assert_response :success
  end
  
  test "should get new" do
    get new_application_url
    assert_response :success
  end

  test "should create application" do
    assert_difference('Application.count') do
      post applications_url, params: { application: { opportunity_id: @another_opp.id, user_id: @user.id } }
    end

    assert_redirected_to application_url(Application.last)
  end

  test "should show application" do
    get application_url(@application)
    assert_response :success
  end

  test "should get edit" do
    get edit_application_url(@application)
    assert_response :success
  end

  test "should update application" do
    patch application_url(@application), params: { application: { opportunity: @opportunity, user: users(:jessie)} }
    assert_redirected_to application_url(@application)
  end

  test "should destroy application" do
    assert_difference('Application.count', -1) do
      delete application_url(@application)
    end

    assert_redirected_to applications_url
  end
end
