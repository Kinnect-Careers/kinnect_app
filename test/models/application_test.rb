require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  setup do
    @company = Company.create(
      image_url: "image1.jpg",
      name: "A Company",
      email: "company@company.com",
      password: "lalalalal",
      password_confirmation: "lalalalal"
    )
    @user1 = User.create(
      name: "User Uno",
      email: "user@uno.com",
      password: "useruseruser1",
      password_confirmation: "useruseruser1"
    )
    
    @opportunity = Opportunity.create(
      title: "Web Designer",
      requirements: "Adobe Ilustrator, Adobe Photoshop, SVG",
      description: "Description1, Description2, Description3, Description4",
      tasks: "Task1, Task2, Task3, Task4",
      company_id: @company.id
    )
    
    @app = Application.new(user_id: @user1.id, opportunity_id: @opportunity.id)

  end
  
  test "application is valid" do
    assert @app.valid?, "application should be valid #{@app.errors.inspect}"
  end
end
