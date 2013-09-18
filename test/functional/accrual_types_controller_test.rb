require 'test_helper'

class AccrualTypesControllerTest < ActionController::TestCase
  setup do
    @accrual_type = accrual_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accrual_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accrual_type" do
    assert_difference('AccrualType.count') do
      post :create, accrual_type: {  }
    end

    assert_redirected_to accrual_type_path(assigns(:accrual_type))
  end

  test "should show accrual_type" do
    get :show, id: @accrual_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accrual_type
    assert_response :success
  end

  test "should update accrual_type" do
    put :update, id: @accrual_type, accrual_type: {  }
    assert_redirected_to accrual_type_path(assigns(:accrual_type))
  end

  test "should destroy accrual_type" do
    assert_difference('AccrualType.count', -1) do
      delete :destroy, id: @accrual_type
    end

    assert_redirected_to accrual_types_path
  end
end
