require 'test_helper'

class AidsControllerTest < ActionController::TestCase
  setup do
    @aid = aids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aid" do
    assert_difference('Aid.count') do
      post :create, aid: {  }
    end

    assert_redirected_to aid_path(assigns(:aid))
  end

  test "should show aid" do
    get :show, id: @aid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aid
    assert_response :success
  end

  test "should update aid" do
    put :update, id: @aid, aid: {  }
    assert_redirected_to aid_path(assigns(:aid))
  end

  test "should destroy aid" do
    assert_difference('Aid.count', -1) do
      delete :destroy, id: @aid
    end

    assert_redirected_to aids_path
  end
end
