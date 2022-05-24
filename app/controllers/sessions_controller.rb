class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:user][:email].downcase)
      if user && user.password == params[:user][:password]
        log_in(user)
        redirect_back_or user
      else
        flash.now[:danger] = t('.invalid_request')
        render 'new'
      end
    end
  
    def destroy
      log_out
      redirect_to root_url
    end
  end
  