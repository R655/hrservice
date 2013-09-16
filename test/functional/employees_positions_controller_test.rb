require 'test_helper'

class EmployeesPositionsControllerTest < ActionController::TestCase
  setup do
    @employees_current_position = employees_current_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employees_current_position" do
    assert_difference('EmployeesCurrentPosition.count') do
      post :create, employees_current_position: {  }
    end

    assert_redirected_to employees_current_position_path(assigns(:employees_current_position))
  end

  test "should show employees_current_position" do
    get :show, id: @employees_current_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employees_current_position
    assert_response :success
  end

  test "should update employees_current_position" do
    put :update, id: @employees_current_position, employees_current_position: {  }
    assert_redirected_to employees_current_position_path(assigns(:employees_current_position))
  end

  test "should destroy employees_current_position" do
    assert_difference('EmployeesCurrentPosition.count', -1) do
      delete :destroy, id: @employees_current_position
    end

    assert_redirected_to employees_current_positions_path
  end
end
