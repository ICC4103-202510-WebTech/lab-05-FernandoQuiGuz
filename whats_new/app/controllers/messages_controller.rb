class MessagesController < ApplicationController
    before_action :set_message, only:  [:show, :edit, :update]
    before_action :authenticate_user!
 
    def index
      @messages = Message.all
    end
  
    def show
      @message = Message.find(params[:id])
    end
  
    def new
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to @message, notice: 'Message was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end 

    def update
      if @message.update(message_params)
        redirect_to @message, notice: 'Message was successfully updated.'
      else
        render :edit
      end 
    end

    private
  
    def message_params
      params.require(:message).permit(:chat_id, :user_id, :body)
    end

    def set_message
      @message = Message.find(params[:id])
    end
  end
  