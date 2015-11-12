class Api::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  # GET /messages
  def index
    if params[:inbox]
      @messages = Message.where(user_id_reciver: params[:user_id]).order(created_at: :desc)
    elsif params[:sender]
      @messages = Message.where(user_id_sender: params[:user_id]).order(created_at: :desc)
    elsif params[:trash]
      @messages = Message.where(user_id_sender: params[:user_id], trash: true).order(created_at: :desc)
    else
      @messages = Message.all
    end
    @messages_list = []
    @messages.each do |message|
      a = ["id", "#{message.id}", "user_id", "#{courier.user_id}", "user", "#{courier.user.name}","trip_description", "#{courier.trip_description}", "location_arrived", "#{courier.location_arrived}", "location_departure", "#{courier.location_departure}", "time_arriv", "#{courier.time_arriv.strftime("%B %d %Y %I:%M%p")}", "departure_time", "#{courier.departure_time.strftime("%B %d %Y %I:%M%p")}"]
      h = Hash[*a]
      @messages_list << h
    end
    render json: { messages: @messages_list, status: "ok" },status: 200 
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id_reciver, :user_id_sender, :messange)
    end
end
