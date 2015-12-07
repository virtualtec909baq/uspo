require 'test_helper'

class SettinsControllerTest < ActionController::TestCase
  setup do
    @settin = settins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settin" do
    assert_difference('Settin.count') do
      post :create, settin: { key: @settin.key, value: @settin.value }
    end

    assert_redirected_to settin_path(assigns(:settin))
  end

  test "should show settin" do
    get :show, id: @settin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settin
    assert_response :success
  end

  test "should update settin" do
    patch :update, id: @settin, settin: { key: @settin.key, value: @settin.value }
    assert_redirected_to settin_path(assigns(:settin))
  end

  test "should destroy settin" do
    assert_difference('Settin.count', -1) do
      delete :destroy, id: @settin
    end

    assert_redirected_to settins_path
  end
end
