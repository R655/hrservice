require 'test_helper'

class EmployeesCrudsControllerTest < ActionController::TestCase
  setup do
    @employees_crud = employees_cruds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees_cruds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employees_crud" do
    assert_difference('EmployeesCrud.count') do
      post :create, employees_crud: {  }
    end

    assert_redirected_to employees_crud_path(assigns(:employees_crud))
  end

  test "should show employees_crud" do
    get :show, id: @employees_crud
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employees_crud
    assert_response :success
  end

  test "should update employees_crud" do
    put :update, id: @employees_crud, employees_crud: {  }
    assert_redirected_to employees_crud_path(assigns(:employees_crud))
  end

  test "should destroy employees_crud" do
    assert_difference('EmployeesCrud.count', -1) do
      delete :destroy, id: @employees_crud
    end

    assert_redirected_to employees_cruds_path
  end
end
