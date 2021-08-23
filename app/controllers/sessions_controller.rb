class SessionsController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
           redirect_to root_path
        end
    end


    def destroy 
        if current_user
          session.delete(:user_id)
          redirect_to root_path
        end   
      end

end