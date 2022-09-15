class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @users = User.new(user_params)
        if @users.save
            redirect_to user_url(@users) #returns user to show
        else
            render json: @users.errors.full_messages, status: :unprocessable_entity
        end

    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user) #returns user to show
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user
            @user.destroy
            redirect_to users_url(@users) # redirects to index
        else
            render json: @users.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        data = {}
        @user = User.find_by(id: params[:id])
        data << @user
        data << @user.artworks
        data << @user.artwork_shared
        render json: data
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
