class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login, :create]

    def create
        @user = User.find_by(username: params[:username])

        # Authenticate user credentials
        if !!@user && @user.authenticate(params[:password])
            # Set user session and redirect on success
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            # Error message on fail
            message = 'Something went wrong! Make sure your username and password are correct.'
            redirect_to login_path, notice: message
        end
    end
end
