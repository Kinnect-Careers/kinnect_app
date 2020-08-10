require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  setup do
    ActionMailer::Base.deliveries.clear  
  end
  
  test "invalid signup" do
    get signupusers_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name: "",
          email: "not@valid",
          password: "fool",
          password_confirmation: "jazz"
        }
      }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "sign up info is valid" do
    get signupusers_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name:                     "Mr Example",
          email:                    "examplejjjjj@examplary.com",
          password:                 "Pass8or!",
          password_confirmation:    "Pass8or!"
        }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    
    # Trying to log in before activation
    login_as(user)
    assert_not is_logged_in?
    
    # Using invalid token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    
    # Valid activation token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'notright@wrong.com')
    assert_not is_logged_in?
    
    # Valid activation token and email
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    assert is_logged_in?
    
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end
