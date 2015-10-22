require 'test_helper'

class PackegesControllerTest < ActionController::TestCase
  setup do
    @packege = packeges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packeges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packege" do
    assert_difference('Packege.count') do
      post :create, packege: { sender_id: @packege.sender_id, status: @packege.status, travel_id: @packege.travel_id }
    end

    assert_redirected_to packege_path(assigns(:packege))
  end

  test "should show packege" do
    get :show, id: @packege
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packege
    assert_response :success
  end

  test "should update packege" do
    patch :update, id: @packege, packege: { sender_id: @packege.sender_id, status: @packege.status, travel_id: @packege.travel_id }
    assert_redirected_to packege_path(assigns(:packege))
  end

  test "should destroy packege" do
    assert_difference('Packege.count', -1) do
      delete :destroy, id: @packege
    end

    assert_redirected_to packeges_path
  end
end
