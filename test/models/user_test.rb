require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user1)
  end
  
  test "application is valid" do
    assert @user.valid?, "application should be valid #{@user.errors.inspect}"
  end
end
