require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:company1)
    @new_company = Company.new(
      name: "New Comp",
      email: "new@comp.com",
      image_url: "new.jpg",
      password: "Pass8or$",
      password_confirmation: "Pass8or$"
    )
  end
  
  test "company is valid" do
    assert @new_company.valid?, "company should be valid #{@new_company.errors.inspect}"
  end
  
  test "name should be present" do
    @new_company.name = " "
    assert_not @new_company.valid?
  end
  
  test "email should be present" do
    @new_company.email = " "
    assert_not @new_company.valid?
  end
  
  test "name should not be too long" do
    @new_company.name = "a" * 81
    assert_not @new_company.valid?
  end
  
  test "name should not be too short" do
    @new_company.name = "a" * 3
    assert_not @new_company.valid?
  end
  
  test "email should not be too long" do
    @new_company.email = "a" * 244 + "@kinnectcareers.com"
    assert_not @new_company.valid?
  end
  
  test "email should not be too short" do
    @new_company.email = "a@acom"
    assert_not @new_company.valid?
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
      @new_company.email = valid_address
      assert @new_company.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "should not accept invalid email addresses" do
    addresses = %w[
        company@example,com
        companyex.COM
        US_A-JR@var.
        this.that@dud_jaz.jz
        heat@meat+grillz.tv
        heat@meat..grillz.tv
      ]
    addresses.each do |invalid_address|
      @new_company.email = invalid_address
      assert @new_company.invalid?, "#{invalid_address.inspect} should not be valid"
    end
  end
  
  test "emails should be unique" do
    @new_company.save
    dup_company = @new_company.dup
    assert_not dup_company.valid?
  end
  
  test "email should be lower cased before saving to database" do
    upanddown_email = "BLaCKsABath@rock.COM"
    @new_company.email = upanddown_email
    @new_company.save
    assert_equal upanddown_email.downcase, @new_company.reload.email
  end
  
  test "password should be present" do 
    @new_company.password = @new_company.password_confirmation = " " * 6
    assert_not @new_company.valid?
  end
  
  test "password should be longer than 6 characters" do
    @new_company.password = @new_company.password_confirmation = "k" * 5
    assert_not @new_company.valid?
  end
end

