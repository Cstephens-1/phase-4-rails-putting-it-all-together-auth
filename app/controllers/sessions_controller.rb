class SessionsController < ApplicationController
def create 
    use = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
        session[:user_id] = user.id 
        render json: user, status: :ok
    else 
        render json: {error: 'invalid username or password'}, status: :unauthorized
    end
end

end
