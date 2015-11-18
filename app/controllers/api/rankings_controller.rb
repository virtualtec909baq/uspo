class Api::RankingsController < ApplicationController
  before_action :set_ranking, only: [:show, :update]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # POST /rankings
  def create
    @ranking = Ranking.new(ranking_params)
    if @ranking.save
      render json: { ranking: @ranking, status: "ok" },status: 200
    else 
      render json: { message: @ranking.errors, status: "not_found" },status: 422
    end
  end

  # PATCH/PUT /rankings/1
  def update
    if @ranking.update(ranking_params)
      render json: { ranking: @ranking, status: "ok" },status: 200
    else 
      render json: { message: @ranking.errors, status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking
      if @ranking = Ranking.find(params[:id])
      else 
        record_not_found(error)
      end
    end

    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 
    # Only allow a trusted parameter "white list" through.
    def ranking_params
      params.require(:ranking).permit(:user_id, :description, :ranking_value, :user_sender_id)
    end
end
