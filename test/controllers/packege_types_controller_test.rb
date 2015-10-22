require 'test_helper'

class PackegeTypesControllerTest < ActionController::TestCase
  setup do
    @packege_type = packege_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packege_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packege_type" do
    assert_difference('PackegeType.count') do
      post :create, packege_type: { description: @packege_type.description }
    end

    assert_redirected_to packege_type_path(assigns(:packege_type))
  end

  test "should show packege_type" do
    get :show, id: @packege_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packege_type
    assert_response :success
  end

  test "should update packege_type" do
    patch :update, id: @packege_type, packege_type: { description: @packege_type.description }
    assert_redirected_to packege_type_path(assigns(:packege_type))
  end

  test "should destroy packege_type" do
    assert_difference('PackegeType.count', -1) do
      delete :destroy, id: @packege_type
    end

    assert_redirected_to packege_types_path
  end
end
