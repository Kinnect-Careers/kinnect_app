require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = Company.create(
      image_url: "image1.jpg",
      name: "A Company",
      email: "company@company.com",
      password: "lalalalal",
      password_confirmation: "lalalalal"
    )
    @not_saved_company = Company.new(
      image_url: "image2.url",
      name: "A Company 2",
      email: "company@company2.com",
      password: "lalalalal",
      password_confirmation: "lalalalal"
    )
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { 
        company: { 
          email: @not_saved_company.email, 
          image_url: @not_saved_company.image_url, 
          name: @not_saved_company.name, 
          password: "jjjjjjjjjj",
          password_confirmation: "jjjjjjjjjj"
        } 
      }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: {
      company: { 
        email: @company.email, 
        image_url: "new_image.jpg", 
        name: @company.name, 
        password: @company.password 
      } 
    }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
