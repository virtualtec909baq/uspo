require 'test_helper'

class TravelsControllerTest < ActionController::TestCase
  setup do
    @travel = travels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count') do
      post :create, travel: { arrive_time: @travel.arrive_time, city_id_departure: @travel.city_id_departure, city_id_destination: @travel.city_id_destination, departure_time: @travel.departure_time, description: @travel.description, img_ticke: @travel.img_ticke, user_id: @travel.user_id }
    end

    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should show travel" do
    get :show, id: @travel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel
    assert_response :success
  end

  test "should update travel" do
    patch :update, id: @travel, travel: { arrive_time: @travel.arrive_time, city_id_departure: @travel.city_id_departure, city_id_destination: @travel.city_id_destination, departure_time: @travel.departure_time, description: @travel.description, img_ticke: @travel.img_ticke, user_id: @travel.user_id }
    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete :destroy, id: @travel
    end

    assert_redirected_to travels_path
  end
end
