require 'test_helper'

class EmployeesPrevPositionsControllerTest < ActionController::TestCase
  setup do
    @employees_prev_position = employees_prev_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees_prev_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employees_prev_position" do
    assert_difference('EmployeesPrevPosition.count') do
      post :create, employees_prev_position: { from_date: @employees_prev_position.from_date, to_date: @employees_prev_position.to_date }
    end

    assert_redirected_to employees_prev_position_path(assigns(:employees_prev_position))
  end

  test "should show employees_prev_position" do
    get :show, id: @employees_prev_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employees_prev_position
    assert_response :success
  end

  test "should update employees_prev_position" do
    put :update, id: @employees_prev_position, employees_prev_position: { from_date: @employees_prev_position.from_date, to_date: @employees_prev_position.to_date }
    assert_redirected_to employees_prev_position_path(assigns(:employees_prev_position))
  end

  test "should destroy employees_prev_position" do
    assert_difference('EmployeesPrevPosition.count', -1) do
      delete :destroy, id: @employees_prev_position
    end

    assert_redirected_to employees_prev_positions_path
  end
end
