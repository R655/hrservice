require 'test_helper'

class EmployeesVisitsControllerTest < ActionController::TestCase
  setup do
    @employees_visit = employees_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employees_visit" do
    assert_difference('EmployeesVisit.count') do
      post :create, employees_visit: {  }
    end

    assert_redirected_to employees_visit_path(assigns(:employees_visit))
  end

  test "should show employees_visit" do
    get :show, id: @employees_visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employees_visit
    assert_response :success
  end

  test "should update employees_visit" do
    put :update, id: @employees_visit, employees_visit: {  }
    assert_redirected_to employees_visit_path(assigns(:employees_visit))
  end

  test "should destroy employees_visit" do
    assert_difference('EmployeesVisit.count', -1) do
      delete :destroy, id: @employees_visit
    end

    assert_redirected_to employees_visits_path
  end
end
