require 'test_helper'

class SickLeavesControllerTest < ActionController::TestCase
  setup do
    @sick_leafe = sick_leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sick_leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sick_leafe" do
    assert_difference('SickLeave.count') do
      post :create, sick_leafe: {  }
    end

    assert_redirected_to sick_leafe_path(assigns(:sick_leafe))
  end

  test "should show sick_leafe" do
    get :show, id: @sick_leafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sick_leafe
    assert_response :success
  end

  test "should update sick_leafe" do
    put :update, id: @sick_leafe, sick_leafe: {  }
    assert_redirected_to sick_leafe_path(assigns(:sick_leafe))
  end

  test "should destroy sick_leafe" do
    assert_difference('SickLeave.count', -1) do
      delete :destroy, id: @sick_leafe
    end

    assert_redirected_to sick_leaves_path
  end
end
