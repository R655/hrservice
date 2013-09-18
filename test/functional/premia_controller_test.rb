require 'test_helper'

class PremiaControllerTest < ActionController::TestCase
  setup do
    @premium = premia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premium" do
    assert_difference('Premium.count') do
      post :create, premium: {  }
    end

    assert_redirected_to premium_path(assigns(:premium))
  end

  test "should show premium" do
    get :show, id: @premium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premium
    assert_response :success
  end

  test "should update premium" do
    put :update, id: @premium, premium: {  }
    assert_redirected_to premium_path(assigns(:premium))
  end

  test "should destroy premium" do
    assert_difference('Premium.count', -1) do
      delete :destroy, id: @premium
    end

    assert_redirected_to premia_path
  end
end
