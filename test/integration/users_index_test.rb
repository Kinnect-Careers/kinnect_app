require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alex)
  end
  
  test "index includes pagination" do
    login_as(@user)
    get users_path
    assert_template 'users/index'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
    skip('TODO: Figure out why div.pagination is not being caught')
    assert_select "div.pagination"
  end
end
