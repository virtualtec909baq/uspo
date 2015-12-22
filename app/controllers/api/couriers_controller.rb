class Api::CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  include ApplicationHelper
  include ActionView::Helpers::DateHelper
  # GET /couriers
  def index
    if params[:q]
      @search = Courier.ransack(params[:q])
      @couriers = @search.result.order(created_at: :desc)
    elsif params[:profile]
      @couriers = Courier.where(user_id: params[:current_user]).order(created_at: :desc)
    else
      @couriers = Courier.all.order(created_at: :desc)
    end
    @couriers_list = []
    @couriers.each do |courier|
      a = ["id", "#{courier.id}", "packages_count", "#{Package.where(courier_id: courier.id).count}","user_id", "#{courier.user_id}","reward", "#{courier.reward}" , "user", "#{courier.user.name}","img_ticket", "#{get_courier_photo(courier)}","pic", "#{get_user_photo(courier.user)}" , "trip_description", "#{courier.trip_description}", "location_arrived", "#{courier.location_arrived}", "location_departure", "#{courier.location_departure}", "time_arriv", "#{courier.time_arriv.strftime("%b %d %I:%M%p")}", "departure_time", "#{courier.departure_time.strftime("%b %d %I:%M%p")}"]
      h = Hash[*a]
      @couriers_list << h
    end
    render json: { couriers: @couriers_list, status: "ok" },status: 200
  end

  # GET /couriers/1
  def show
    courier = []
    users = []
    if params[:profile]
      a = ["id", "#{@courier.id}", "packages_count", "#{Package.where(courier_id: @courier.id).count}","user_id", "#{@courier.user_id}", "trip_description", "#{@courier.trip_description}", "img_ticket", "#{@courier.img_ticket}", "location_arrived", "#{@courier.location_arrived}", "location_departure", "#{@courier.location_departure}", "departure_time", "#{@courier.departure_time.strftime("%b %d %I:%M%p")} ", "time_arrive", "#{@courier.time_arriv.strftime("%b %d %I:%M%p")}"]
      h = Hash[*a]
      courier << h
      Package.where(courier_id: @courier.id).each do |u|
        User.where(id: u.user_id).each do |us|
          array_user = ["id", "#{u.id}", "name_package", "#{u.name}","city", "#{u.city}","zipe_code", "#{u.zipe_code}","place", "#{u.place}","date", "#{u.date}","description", "#{u.description}","phone", "#{u.phone}", "acceted_request", "#{u.acceted_request}","id_user", "#{u.user_id}","name", "#{us.name}","pic", "#{us.pic}","created_at", "#{time_ago_in_words(u.created_at)}"]
          h_user = Hash[*array_user]
          users << h_user
        end
      end
      render json: { courier: courier, users: users , status: "ok" },status: 200
    else
      a = ["id", "#{@courier.id}","reward", "#{@courier.reward}", "packages_count", "#{Package.where(courier_id: @courier.id).count}","user_id", "#{@courier.user_id}", "trip_description", "#{@courier.trip_description}", "img_ticket", "#{@courier.img_ticket}", "location_arrived", "#{@courier.location_arrived}", "location_departure", "#{@courier.location_departure}", "departure_time", "#{@courier.departure_time.strftime("%b %d %I:%M%p")} ", "time_arrive", "#{@courier.time_arriv.strftime("%b %d %I:%M%p")}"]
      h = Hash[*a]
      courier << h
      render json: { courier: courier, status: "ok" },status: 200
    end
  end    

  # POST /couriers
  
  def create
    @courier = []
    courier = Courier.new(courier_params)
    if courier.save
      @courier << courier
      render json: { courier: @courier, status: "ok" },status: 200
    else 
      render json: { courier: courier.errors, status: "not_found" },status: 422
    end
  end

  # PATCH/PUT /couriers/1
  def update
    courier = []
    if @courier.update(courier_params)
      courier << @courier
      render json: { courier: courier, status: "ok" },status: 200
    else 
      render json: { message: @courier.errors, status: "not_found" },status: 422
    end
  end

  # DELETE /couriers/1
  def destroy
    if @courier.destroy
      render json: { courier: @courier, status: "ok" },status: 200
    else 
      render json: { message: "courier not_found", status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      if @courier = Courier.find(params[:id])
      else 
        record_not_found(error)
      end
    end
    
    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 

    # Only allow a trusted parameter "white list" through.
    def courier_params
      params.require(:courier).permit(:user_id, :trip_description, :img_ticket, :location_arrived, :location_departure, :time_arriv, :departure_time, :reward)
    end
end
