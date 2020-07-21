require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  setup do
    @opportunity = opportunities(:opp1)
    @user1 = User.create(
      name: "User Uno",
      email: "user@uno.com",
      password: "useruseruser1",
      password_confirmation: "useruseruser1"
    )
    @app = Application.new(user_id: @user1.id, opportunity_id: @opportunity.id)
    
  end
  
  test "application is valid" do
    assert @app.valid?, "application should be valid #{@app.errors.inspect}"
  end
end
