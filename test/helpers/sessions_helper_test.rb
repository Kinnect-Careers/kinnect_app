require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  setup do
    @user = users(:alex)
    remember(@user)
  end
  
  test "current_user returns alex when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end
  
  test "current_user returns nil when remember_digest is incorrect" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end