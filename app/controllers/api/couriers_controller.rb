class Api::CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # GET /couriers
  def index
    @couriers = Courier.all
  end

  # GET /couriers/1
  def show
  end

  # POST /couriers
  
  def create
    @courier = Courier.new(courier_params)
    if @courier.save
      render json: { courier: @courier, status: "ok" },status: 200
    else 
      render json: { message: @courier.errors, status: "not_found" },status: 422
    end
  end

  # PATCH/PUT /couriers/1
  def update
    if @courier.update(courier_params)
      render json: { courier: @courier, status: "ok" },status: 200
    else 
      render json: { message: @courier.errors, status: "not_found" },status: 422
    end
  end

  # DELETE /couriers/1
  def destroy
    if @courier.destroy
      render json: { courier: @courier, status: "ok" },status: 200
    else 
      render json: { message: @courier.errors, status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      if @courier = Courier.find(params[:id])
        render json: { courier: @courier, status: "ok" },status: 200
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
