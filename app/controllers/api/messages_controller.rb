class Api::MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  include ApplicationHelper
  
  # GET /messages
  def index
    if params[:inbox]
      @messages = Message.where(:user_id_receiver => params[:user_id]).select("DISTINCT ON (user_id_sender) *") 
    elsif params[:sender]
      @messages = Message.where(:user_id_sender => params[:user_id]).select("DISTINCT ON (user_id_receiver) *") 
    end
    @messages_list = []
    @messages.each do |message|
      if User.exists?(message.user_id_sender)
        @user_id_sender = User.find(message.user_id_sender)
        a = ["id", "#{message.id}", "history_id", "#{message.history_id}", "message", "#{message.message}", "user_id_receiver", "#{message.user_id_receiver}", "user_id_sender", "#{message.user_id_sender}","user_name_sender", "#{@user_id_sender.name}", "user_img_sender", "#{get_user_photo(@user_id_sender)}",  "created_at", "#{message.created_at.strftime("%B %d %Y %I:%M%p")}" ]
      else
        a = ["id", "#{message.id}", "history_id", "#{message.history_id}","message", "#{message.message}","user_id_receiver", "#{message.user_id_receiver}", "user_id_sender","#{message.user_id_sender}", "user_name_sender", " ", "user_img_sender", " ",  "created_at", "#{message.created_at.strftime("%B %d %Y %I:%M%p")}" ]
      end
      h = Hash[*a]
      @messages_list << h
    end
    render json: { messages: @messages_list, status: "ok" },status: 200 
  end

  # GET /messages/1
  
  def show
    @messages = History.find(@message.history_id).messages
    @messages_list = []
    @messages.each do |message|
      @user_id_sender = User.find(message.user_id_sender)
      a = ["message", "#{message.message}", "user_id_receiver", "#{message.user_id_receiver}", "user_id_sender", "#{message.user_id_sender}","user_name_sender", "#{@user_id_sender.name}","user_img_sender", "#{get_user_photo(@user_id_sender)}", "created_at", "#{message.created_at.strftime("%b %d %I:%M%p")}" ]
      h = Hash[*a]
      @messages_list << h
    end
    render json: { messages: @messages_list, status: "ok" },status: 200 
  end

  # POST /messages
  
  def create
    message = Message.new(message_params)
    @message = []
    if message.save
      if message.history_id.blank?
          @h =  History.create()
        message.update(history_id: @h.id)
      end
      @message << message
      render json: { message: @message, status: "ok" },status: 200
    else
      render json: { message: @message.errors, status: "not_found" },status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      if @message = Message.find(params[:id])
      else 
        record_not_found(error)
      end
    end

    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id_receiver, :user_id_sender, :message, :history_id)
    end
end
