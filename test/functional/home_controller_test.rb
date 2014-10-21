require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get createDigit" do
    get :createDigit
    assert_response :success
  end

  test "should get checkDigit" do
    get :checkDigit
    assert_response :success
  end

end
