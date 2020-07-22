require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)
    @another_user = users(:jessie)
    @admin_user = users(:rick)
  end

  test "should get index" do
    login_as(@user)
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_user_url
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
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    login_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    login_as(@user)
    patch user_url(@user), params:{ 
      user: { 
          email: @user.email,
          name: "Newnamo Self", 
          password: "Pass8or$",
          password_confirmation: "Pass8or$"
        } 
      }
      
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    login_as(@admin_user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_user_url
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    assert_not flash.empty?
    assert_redirected_to login_user_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    login_as(@another_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    login_as(@another_user)
    patch user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email, 
        password: 'Pass8or$',
        password_confirmation: 'Pass8or$'
      }
    }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "shoudl not allow the admin attribute to be edited via web request" do
    login_as(@user)
    assert_not @user.admin?
    patch user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email,
        password: 'Pass8or$',
        password_confirmation: 'Pass8or$',
        admin: true
      }
    }
    assert_not @user.reload.admin?
  end
end
