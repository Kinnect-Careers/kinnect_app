require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      name: "New User",
      email: "newuser@example.com",
      password: "wronGplacefo?ol33",
      password_confirmation: "wronGplacefo?ol33"
    )
  end
  
  test "user is valid" do
    assert @user.valid?, "user should be valid #{@user.errors.inspect}"
  end
  
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "name should not be too short" do
    @user.name = "a" * 3
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 244 + "@kinnectcareers.com"
    assert_not @user.valid?
  end
  
  test "email should not be too short" do
    @user.email = "a@acom"
    assert_not @user.valid?
  end
  
  test "should accept valid email addresses" do
    addresses = %w[
        user@example.com
        USER@ex.COM
        US_A-JR@var.bar.gov
        this.that@dud.jz
        heat+meat@grillz.tv
      ]
    addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "should accept invalid email addresses" do
    addresses = %w[
        user@example,com
        USERex.COM
        US_A-JR@var.
        this.that@dud_jaz.jz
        heat@meat+grillz.tv
        heat@meat..grillz.tv
      ]
    addresses.each do |invalid_address|
      @user.email = invalid_address
      assert @user.invalid?, "#{invalid_address.inspect} should not be valid"
    end
  end
  
  test "emails should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end
  
  test "email should be lower cased before saving to database" do
    upanddown_email = "BLaCKsABath@rock.COM"
    @user.email = upanddown_email
    @user.save
    assert_equal upanddown_email.downcase, @user.reload.email
  end
  
  test "password should be present" do 
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should be longer than 6 characters" do
    @user.password = @user.password_confirmation = "k" * 5
    assert_not @user.valid?
  end
  
  test "authenticated? should return false for nil user.digest" do
    assert_not @user.authenticated?('')
  end
end
