class Api::RemittentsController < ApplicationController
  before_action :set_remittent, only: [:show, :edit, :update, :destroy]

  # GET /remittents
  def index
    @remittents = Remittent.all
  end

  # GET /remittents/1
  def show
  end

  # GET /remittents/new
  def new
    @remittent = Remittent.new
  end

  # GET /remittents/1/edit
  def edit
  end

  # POST /remittents
  def create
    @remittent = Remittent.new(remittent_params)

    if @remittent.save
      redirect_to @remittent, notice: 'Remittent was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /remittents/1
  def update
    if @remittent.update(remittent_params)
      redirect_to @remittent, notice: 'Remittent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /remittents/1
  def destroy
    @remittent.destroy
    redirect_to remittents_url, notice: 'Remittent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remittent
      @remittent = Remittent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def remittent_params
      params.require(:remittent).permit(:user_id, :description, :packege_img, :location_arrived, :location_departure, :packege_type_id, :description_location, :status)
    end
end
