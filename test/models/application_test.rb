require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  setup do
    @company = companies(:company1)
    @user1 = users(:user1)
    @opportunity = opportunities(:opp1)
    @app = Application.new(user_id: @user1.id, opportunity_id: @opportunity.id)
  end
  
  test "application is valid" do
    assert @app.valid?, "application should be valid #{@app.errors.inspect}"
  end
end
