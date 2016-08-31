require 'test_helper'

class MyControllerTest < ActionDispatch::IntegrationTest
  test "should get pwd" do
    get my_pwd_url
    assert_response :success
  end

end
