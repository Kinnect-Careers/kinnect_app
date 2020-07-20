require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  setup do
    @app = applications(:app1)
  end
  
  test "application is valid" do
    assert @app.valid?, "application should be valid #{@app.errors.inspect}"
  end
end
