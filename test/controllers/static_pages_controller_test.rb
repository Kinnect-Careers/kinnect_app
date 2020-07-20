require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Kinnect Careers"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact"
  end

  test "should get faq" do
    get static_pages_faq_url
    assert_response :success
    assert_select "title", "FAQ"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About"
  end

end
