class Api::RemittentsController < ApplicationController
  before_action :set_remittent, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  include ApplicationHelper
  include ActionView::Helpers::DateHelper
  # GET /remittents
  def index
    if params[:q]
      @search = Remittent.ransack(params[:q])
      @remittents = @search.result.order(created_at: :desc)
    else
      @remittents = Remittent.all.order(created_at: :desc)
    end
    @remittents_list = []
    @remittents.each do |remittent|
      a = ["id", "#{remittent.id}", "user_id", "#{remittent.user_id}", "user", "#{remittent.user.name}","pic", "#{get_user_photo(remittent.user)}" , "packege_img", "#{get_package_photo(remittent)}" ,"description", "#{remittent.description}", "packege_img", "#{get_package_photo(remittent)}", "location_arrived", 
        "#{remittent.location_arrived}", "location_departure", "#{remittent.location_departure}", "created_at", "#{time_ago_in_words(remittent.created_at)}"]
      h = Hash[*a]
      @remittents_list << h
    end
    render json: { remittents: @remittents_list, status: "ok" },status: 200
  end

  # GET /remittents/1
  def show
    remittent = []
    remittent << @remittent
    render json: { remittent: remittent, status: "ok" },status: 200
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
    remittent = []
    if @remittent.update(remittent_params)
      remittent << @remittent
      render json: { remittent: remittent, status: "ok" },status: 200
    else 
      render json: { message: @remittent.errors, status: "not_found" },status: 422
    end
  end

  # DELETE /remittents/1
  def destroy
    if @remittent.destroy
      render json: { remittent: @remittent, status: "ok" },status: 200
    else 
      render json: { message: "remittent not_found", status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remittent
      if @remittent = Remittent.find(params[:id])
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
    end
end
