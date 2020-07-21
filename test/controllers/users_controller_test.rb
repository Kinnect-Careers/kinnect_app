require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(
      name: "User Unanimus", 
      email: "mre@example.com",
      password: "Fool!fool5",
      password_confirmation: "Fool!fool5"
    )
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: {
        user: { email: "new@new.com", name: @user.name, password: "%laLalala123", password_confirmation: "%laLalala123" }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    @user.save
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    @user.save
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params:
      { user: { email: @user.email, name: "Newnamo Self", password: @user.password } }
      
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
