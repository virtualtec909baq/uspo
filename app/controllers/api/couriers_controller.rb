class Api::CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  include ApplicationHelper
  # GET /couriers
  def index
    if params[:q]
      @search = Courier.ransack(params[:q])
      @couriers = @search.result.order(created_at: :desc)
    else
      @couriers = Courier.all.order(created_at: :desc)
    end
    @couriers_list = []
    @couriers.each do |courier|
      a = ["id", "#{courier.id}", "user_id", "#{courier.user_id}", "user", "#{courier.user.name}","img_ticket", "#{get_courier_photo(courier)}","pic", "#{get_user_photo(courier.user)}" , "trip_description", "#{courier.trip_description}", "location_arrived", "#{courier.location_arrived}", "location_departure", "#{courier.location_departure}", "time_arriv", "#{courier.time_arriv.strftime("%B %d %Y %I:%M%p")}", "departure_time", "#{courier.departure_time.strftime("%b %d %I:%M%p")}"]
      h = Hash[*a]
      @couriers_list << h
    end
    render json: { couriers: @couriers_list, status: "ok" },status: 200
  end

  # GET /couriers/1
  def show
    courier = []
    courier << @courier
    render json: { courier: courier, status: "ok" },status: 200
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
      params.require(:courier).permit(:user_id, :trip_description, :img_ticket, :location_arrived, :location_departure, :time_arriv, :departure_time)
    end
end
