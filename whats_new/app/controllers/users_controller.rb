class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user, notice: "User created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end 

    def update
      if @user.update(user_params)
        redirect_to @user, notice: "User updated successfully."
      else
        render :edit, status: :unprocessable_entity 
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end

    def set_user
      @user = User.find params[:id]

    end

  end
  