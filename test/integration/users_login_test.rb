require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:alex)
  end
  
  test "login with invalid credentials" do
    get login_user_path
    assert_template 'sessions/new'
    post login_user_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash[:danger].nil?, "Danger message should be in flash"
    get root_path
    assert flash.empty?, "Flash should be empty"
  end
  
  test "login with valid email and invalid password" do 
    get login_user_path
    assert_template 'sessions/new'
    post login_user_path, params: { 
      session: { 
        email:    "a@a.com", 
        password: "notvalid"
      }
    }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid info and logout right after" do
    get login_user_path
    post login_user_path, params: { 
      session: {
        email: @user.email,
        password: 'Pass8or$'
      } }
    assert is_logged_in?, "User should be logged in"
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_user_path, count: 0
    assert_select "a[href=?]", logout_user_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_user_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_user_path
    assert_select "a[href=?]", logout_user_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
