require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
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
          email:                    "example@examplary.com",
          password:                 "Pass8or!",
          password_confirmation:    "Pass8or!"
        }
      }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash[:success].nil?
  end
  
end
