class SettinsController < ApplicationController
  before_action :set_settin, only: [:show, :edit, :update, :destroy]

  # GET /settins
  def index
    @settins1 = Settin.where(:id => 1..21)
    @settins2 = Settin.last(3) 
  end

  # GET /settins/1
  def show
  end

  # GET /settins/new
  def new
    @settin = Settin.new
  end

  # GET /settins/1/edit
  def edit
  end

  # POST /settins
  def create
    @settin = Settin.new(settin_params)

    if @settin.save
      redirect_to @settin, notice: 'Settin was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /settins/1
  def update
    if @settin.update(settin_params)
      redirect_to settins_url, notice: 'Settin was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /settins/1
  def destroy
    @settin.destroy
    redirect_to settins_url, notice: 'Settin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settin
      @settin = Settin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def settin_params
      params.require(:settin).permit(:key, :value, :image)
    end
end
