class Api::RemittentsController < ApplicationController
  before_action :set_remittent, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /remittents
  def index
    if params[:q]
      @search = Remittent.ransack(params[:q])
      @remittents = @search.result.order(created_at: :desc)
    else
      @remittents = Remittent.all.order(created_at: :desc)
    end
    render json: { remittents: @remittents, status: "ok" },status: 200
  end

  # GET /remittents/1
  def show
  end

  # POST /remittents
  def create
    remittent = Remittent.new(remittent_params)
    @remittent = []
    if remittent.save
      @remittent << remittent
      render json: { remittent: @remittent, status: "ok" },status: 200
    else 
      render json: { message: @remittent.errors, status: "not_found" },status: 422
    end
  end

  # PATCH/PUT /remittents/1
  def update
    @remittent = []
    if remittent.update(remittent_params)
      @remittent << remittent
      render json: { remittent: @remittent, status: "ok" },status: 200
    else 
      render json: { message: @remittent.errors, status: "not_found" },status: 422
    end
  end

  # DELETE /remittents/1
  def destroy
    @remittent = []
    if remittent.destroy
      @remittent << remittent
      render json: { courier: @remittent, status: "ok" },status: 200
    else 
      render json: { message: "remittent not_found", status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remittent
      if @remittent = Remittent.find(params[:id])
        render json: { courier: @remittent, status: "ok" },status: 200
      else 
        record_not_found(error)
      end
    end
    
    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def remittent_params
      params.require(:remittent).permit(:user_id, :description, :packege_img, :location_arrived, :location_departure, :packege_type_id, :description_location, :status)
      params.require(:remittent).permit(:user_id, :description, :packege_img, :location_arrived, :location_departure, :packege_type_id, :description_location, :status)
    end
end
