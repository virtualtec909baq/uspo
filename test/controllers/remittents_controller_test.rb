require 'test_helper'

class RemittentsControllerTest < ActionController::TestCase
  setup do
    @remittent = remittents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remittents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remittent" do
    assert_difference('Remittent.count') do
      post :create, remittent: { description: @remittent.description, description_location: @remittent.description_location, location_arrived: @remittent.location_arrived, location_departure: @remittent.location_departure, packege_img: @remittent.packege_img, packege_type_id: @remittent.packege_type_id, status: @remittent.status, user_id: @remittent.user_id }
    end

    assert_redirected_to remittent_path(assigns(:remittent))
  end

  test "should show remittent" do
    get :show, id: @remittent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remittent
    assert_response :success
  end

  test "should update remittent" do
    patch :update, id: @remittent, remittent: { description: @remittent.description, description_location: @remittent.description_location, location_arrived: @remittent.location_arrived, location_departure: @remittent.location_departure, packege_img: @remittent.packege_img, packege_type_id: @remittent.packege_type_id, status: @remittent.status, user_id: @remittent.user_id }
    assert_redirected_to remittent_path(assigns(:remittent))
  end

  test "should destroy remittent" do
    assert_difference('Remittent.count', -1) do
      delete :destroy, id: @remittent
    end

    assert_redirected_to remittents_path
  end
end
