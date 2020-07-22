require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)
  end
  
  test "unsuccessful edit" do
    login_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        name: "",
        email: "alex@alex",
        password: "nah",
        password_confirmation: "brah"
      }
    }
    assert_not flash.nil?
    assert_template 'users/edit'
    assert_select "div.alert", {text: 'The form contains 8 errors.'}
  end
  
  test "successful edit" do
    login_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Alex Honnold"
    email = "alex@honnold.com"
    patch user_path(@user), params: { 
      user: {
        name: name,
        email: email,
        password: 'Pass8or$',
        password_confirmation: 'Pass8or$'
      }
    }
    
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    
  end
  
  test "successful edit with forwarding" do
    get edit_user_path(@user)
    login_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "John Doe"
    email = "john@doe.com"
    patch user_path(@user), params: {
      user: {
        name: name,
        email: email,
        password: 'Pass8or$',
        password_confirmation: 'Pass8or$'
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
