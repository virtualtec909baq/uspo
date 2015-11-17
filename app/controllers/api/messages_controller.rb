class Api::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  include ApplicationHelper
  # GET /messages
  def index
    if params[:inbox]
      @messages = Message.where(user_id_receiver: params[:user_id]).order(created_at: :desc)
    elsif params[:sender]
      @messages = Message.where(user_id_sender: params[:user_id]).order(created_at: :desc)
    elsif params[:trash]
      @messages = Message.where(user_id_sender: params[:user_id], trash: true).order(created_at: :desc)
    else
      @messages = Message.all
    end
    @messages_list = []
    @messages.each do |message|
      if User.exists?(message.user_id_sender)
        @user_id_sender = User.find(message.user_id_sender)
        a = ["id", "#{message.id}","message", "#{message.message}", "user_id_reciver", "#{message.user_id_receiver}", "user_id_sender", "#{message.user_id_sender}","user_name_sender", "#{@user_id_sender.name}", "user_img_sender", "#{get_user_photo(@user_id_sender)}",  "created_at", "#{message.created_at.strftime("%B %d %Y %I:%M%p")}" ]
      else
        a = ["id", "#{message.id}", "message", "#{message.message}","user_id_reciver", "#{message.user_id_receiver}", "user_id_sender","#{message.user_id_sender}", "user_name_sender", " ", "user_img_sender", " ",  "created_at", "#{message.created_at.strftime("%B %d %Y %I:%M%p")}" ]
      end
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
      render json: { message: @message, status: "ok" },status: 200
    else
      render json: { message: @message.errors, status: "not_found" },status: 422
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
      if @message = Message.find(params[:id])
      else 
        record_not_found(error)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id_receiver, :user_id_sender, :message)
    end
end
