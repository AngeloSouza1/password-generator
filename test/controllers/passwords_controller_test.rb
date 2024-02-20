require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passwords_index_url
    assert_response :success
  end

  test "should get generate_password" do
    get passwords_generate_password_url
    assert_response :success
  end
end
