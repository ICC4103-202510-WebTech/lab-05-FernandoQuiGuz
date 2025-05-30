class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.accessible_by(current_ability)
  end

  def show
    # @chat ya está cargado y autorizado por load_and_authorize_resource
  end

  def new
    # @chat ya está inicializado por load_and_authorize_resource
  end

  def create
    @chat.sender = current_user
    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @chat ya está cargado y autorizado
  end

  def update
    if chat_params[:sender_id].present? && chat_params[:sender_id].to_i != @chat.sender_id
      flash.now[:alert] = "No puedes cambiar el sender del chat."
      @chat.assign_attributes(chat_params.except(:sender_id))
      render :edit, status: :unprocessable_entity and return
    end

    if @chat.update(chat_params.except(:sender_id))
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id, :sender_id)
  end
end
