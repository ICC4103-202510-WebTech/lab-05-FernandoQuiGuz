class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    unless user_in_chat?(@message.chat_id)
      flash.now[:alert] = "Solo puedes enviar mensajes en chats donde participas."
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
    flash.now[:alert] = "No puedes cambiar el sender del mensaje."
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

  def user_in_chat?(chat_id)
    chat = Chat.find_by(id: chat_id)
    chat && (chat.sender_id == current_user.id || chat.receiver_id == current_user.id)
  end
end
