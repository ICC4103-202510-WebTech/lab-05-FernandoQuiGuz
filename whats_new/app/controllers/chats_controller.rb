class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :edit, :update]
    before_action :authenticate_user!

    def index
      @chats = Chat.all
    end
  
    def show
    end
  
    def new
      @chat = Chat.new
    end
  
    def create
      @chat = Chat.new(chat_params)
      if @chat.save
        redirect_to @chat, notice: 'Chat was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end

    def update
      if @chat.update(chat_params)
        redirect_to @chat
      else
        render :edit
      end 
    end
    
    private
  
    def chat_params
      params.require(:chat).permit(:sender_id, :receiver_id)
    end

    def set_chat 
      @chat = Chat.find(params[:id])
    end 

  end
  