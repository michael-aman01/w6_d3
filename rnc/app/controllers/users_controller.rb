class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def create
        @user = User.create!(user_params)
        if @user.save
            
    end

    def update
    end

    def destroy
    end

    def show
    end

    def edit
    end

    def new
    end

    private

    def user_params
        params.require(:user).permits(:username)
    end



end
