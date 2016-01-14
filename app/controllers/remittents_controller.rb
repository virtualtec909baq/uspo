class RemittentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_remittent, only: [:show]

  # GET /remittents
  def index
    @search = User.ransack(params[:q])
    @users = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /remittents/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remittent
      @user = User.find(params[:id])
    end

end
