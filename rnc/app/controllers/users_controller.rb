class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @users = User.create!(user_params)
        if @users.save
            redirect_to user_url(@users)
            #redirect_to :action => "index"
        else
            render json: @users.errors.full_messages, status: :unprocessable_entity
        end

    end

    def update
    end

    def destroy
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def edit
    end

    def new
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end



end
