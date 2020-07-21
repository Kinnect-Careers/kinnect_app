require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = Company.create(
      image_url: "image1.jpg",
      name: "A Company",
      email: "company@company.com",
      password: "lalalalal",
      password_confirmation: "lalalalal"
    )
  end
  
  test "company is valid" do
    assert @company.valid?, "company should be valid #{@company.errors.inspect}"
  end
  
  test "name should be present" do
    @company.name = " "
    assert_not @company.valid?
  end
  
  test "email should be present" do
    @company.email = " "
    assert_not @company.valid?
  end
  
  test "name should not be too long" do
    @company.name = "a" * 81
    assert_not @company.valid?
  end
  
  test "name should not be too short" do
    @company.name = "a" * 3
    assert_not @company.valid?
  end
  
  test "email should not be too long" do
    @company.email = "a" * 244 + "@kinnectcareers.com"
    assert_not @company.valid?
  end
  
  test "email should not be too short" do
    @company.email = "a@acom"
    assert_not @company.valid?
  end
  
  test "should accept valid email addresses" do
    addresses = %w[
        company@example.com
        company@ex.COM
        US_A-JR@var.bar.gov
        this.that@dud.jz
        heat+meat@grillz.tv
      ]
    addresses.each do |valid_address|
      @company.email = valid_address
      assert @company.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "should accept invalid email addresses" do
    addresses = %w[
        company@example,com
        companyex.COM
        US_A-JR@var.
        this.that@dud_jaz.jz
        heat@meat+grillz.tv
        heat@meat..grillz.tv
      ]
    addresses.each do |invalid_address|
      @company.email = invalid_address
      assert @company.invalid?, "#{invalid_address.inspect} should not be valid"
    end
  end
  
  test "emails should be unique" do
    dup_company = @company.dup
    @company.save
    assert_not dup_company.valid?
  end
  
  test "email should be lower cased before saving to database" do
    upanddown_email = "BLaCKsABath@rock.COM"
    @company.email = upanddown_email
    @company.save
    assert_equal upanddown_email.downcase, @company.reload.email
  end
  
  test "password should be present" do 
    @company.password = @company.password_confirmation = " " * 6
    assert_not @company.valid?
  end
  
  test "password should be longer than 6 characters" do
    @company.password = @company.password_confirmation = "k" * 5
    assert_not @company.valid?
  end
end
