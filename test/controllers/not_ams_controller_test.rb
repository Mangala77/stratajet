require 'test_helper'

class NotAmsControllerTest < ActionController::TestCase
  setup do
    @not_am = not_ams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:not_ams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create not_am" do
    assert_difference('NotAm.count') do
      post :create, not_am: { notam_data: @not_am.notam_data, text: @not_am.text }
    end

    assert_redirected_to not_am_path(assigns(:not_am))
  end

  test "should show not_am" do
    get :show, id: @not_am
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @not_am
    assert_response :success
  end

  test "should update not_am" do
    patch :update, id: @not_am, not_am: { notam_data: @not_am.notam_data, text: @not_am.text }
    assert_redirected_to not_am_path(assigns(:not_am))
  end

  test "should destroy not_am" do
    assert_difference('NotAm.count', -1) do
      delete :destroy, id: @not_am
    end

    assert_redirected_to not_ams_path
  end
end
