class UsersController < ApplicationController

    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id 
            render json: user, status: :created
        else 
            render json: user.error, status: :unprocessable_entity
        end
    end

    def show 
        if current_user
            render json: current_user, status: :ok
        else
            render json: {user: 'not logged in'}, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
