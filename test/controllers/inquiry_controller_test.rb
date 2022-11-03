require 'test_helper'

class InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get user_name:" do
    get inquiry_user_name:_url
    assert_response :success
  end

  test "should get string" do
    get inquiry_string_url
    assert_response :success
  end

  test "should get email:" do
    get inquiry_email:_url
    assert_response :success
  end

  test "should get string" do
    get inquiry_string_url
    assert_response :success
  end

  test "should get content:" do
    get inquiry_content:_url
    assert_response :success
  end

  test "should get text" do
    get inquiry_text_url
    assert_response :success
  end

end
