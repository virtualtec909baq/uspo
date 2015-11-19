class Api::RankingsController < ApplicationController
  before_action :set_ranking, only: [:update]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def show
    user = User.find(params[:id])
    rankings = user.rankings.order(created_at: :asc)
    @rankings_list = []
    @rankings.each do |ranking|
      if User.exists?(user_sender_id)
        sender = User.find(user_sender_id)
        rankings_array = ["id", "#{ranking.id}", "description", "#{ranking.description}", "ranking_value", "#{ranking.ranking_value}","pic", "#{get_user_photo(sender)}","user_name", "#{sender.name}" ,"created_at", "#{ranking.created_at.strftime("%B %d %Y %I:%M%p")}"]
        rankings_hash = Hash[*rankings_array]
        @rankings_list << rankings_hash
      end
    end
    render json: { rankings: @rankings_list, status: "ok" },status: 200
  end

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
