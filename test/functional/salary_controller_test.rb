require 'test_helper'

class SalaryControllerTest < ActionController::TestCase
  test "should get select_table" do
    get :select_table
    assert_response :success
  end

  test "should get table" do
    get :table
    assert_response :success
  end

end
