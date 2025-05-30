class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @messages = Message.accessible_by(current_ability)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    unless @message.chat.present? && (@message.chat.sender_id == current_user.id || @message.chat.receiver_id == current_user.id)
      flash.now[:alert] = "You can only send messages in chats you participate in."
      render :new, status: :unprocessable_entity and return
    end

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:message][:user_id].present? && params[:message][:user_id].to_i != @message.user_id
      flash.now[:alert] = "You can't change the sender of the message."
      return render :edit, status: :unprocessable_entity
    end

    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :body)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
