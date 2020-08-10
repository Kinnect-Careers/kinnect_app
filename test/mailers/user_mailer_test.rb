require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:alex)  
  end
  
  test "account_activation" do
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Account activation", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["sanunes.ricardo@gmail.com"], mail.from
    assert_match @user.name,                    mail.body.encoded
    assert_match @user.activation_token,        mail.body.encoded
    assert_match CGI.escape(@user.email),       mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset(@user)
    assert_equal "Password Reset", mail.subject
    assert_equal ["a@hannold.com"], mail.to
    assert_equal ["sanunes.ricardo@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end