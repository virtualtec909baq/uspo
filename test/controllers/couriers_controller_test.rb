require 'test_helper'

class CouriersControllerTest < ActionController::TestCase
  setup do
    @courier = couriers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:couriers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create courier" do
    assert_difference('Courier.count') do
      post :create, courier: { departure_time: @courier.departure_time, img_ticket: @courier.img_ticket, location_arrived: @courier.location_arrived, location_departure: @courier.location_departure, time_arriv: @courier.time_arriv, trip_description: @courier.trip_description, user_id: @courier.user_id }
    end

    assert_redirected_to courier_path(assigns(:courier))
  end

  test "should show courier" do
    get :show, id: @courier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @courier
    assert_response :success
  end

  test "should update courier" do
    patch :update, id: @courier, courier: { departure_time: @courier.departure_time, img_ticket: @courier.img_ticket, location_arrived: @courier.location_arrived, location_departure: @courier.location_departure, time_arriv: @courier.time_arriv, trip_description: @courier.trip_description, user_id: @courier.user_id }
    assert_redirected_to courier_path(assigns(:courier))
  end

  test "should destroy courier" do
    assert_difference('Courier.count', -1) do
      delete :destroy, id: @courier
    end

    assert_redirected_to couriers_path
  end
end
