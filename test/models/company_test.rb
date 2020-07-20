require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:company1)
  end
  
  test "application is valid" do
    assert @company.valid?, "application should be valid #{@company.errors.inspect}"
  end
end
