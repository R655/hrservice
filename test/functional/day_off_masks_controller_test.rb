require 'test_helper'

class DayOffMasksControllerTest < ActionController::TestCase
  setup do
    @day_off_mask = day_off_masks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_off_masks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_off_mask" do
    assert_difference('DayOffMask.count') do
      post :create, day_off_mask: {  }
    end

    assert_redirected_to day_off_mask_path(assigns(:day_off_mask))
  end

  test "should show day_off_mask" do
    get :show, id: @day_off_mask
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_off_mask
    assert_response :success
  end

  test "should update day_off_mask" do
    put :update, id: @day_off_mask, day_off_mask: {  }
    assert_redirected_to day_off_mask_path(assigns(:day_off_mask))
  end

  test "should destroy day_off_mask" do
    assert_difference('DayOffMask.count', -1) do
      delete :destroy, id: @day_off_mask
    end

    assert_redirected_to day_off_masks_path
  end
end
