class UsersController < ApplicationController

    before_action :logged_in_user, only: [:show]
    before_filter :session_expires, except: [:create, :new]
    before_filter :update_session_time, except: [:create, :new]

    def create
        @user = User.new(users_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the app!"
            UserCreationMail.mailer(@user).deliver_now
            redirect_to @user
        else
            render 'new'
        end
    end

    def new
        @user = User.new
    end

    def index
        all_user_ids = User.where.not(id: current_user.id).map(&:id)
        follower_ids= current_user.followings.map { |item| item[:id] }
        @users = (all_user_ids - follower_ids).map{ |item| User.find(item) }        
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(current_user.id)
        @user.destroy
        redirect_to root_url
    end

    private
        def users_params
            params.require(:user).permit(:name, :email, :password)
        end

end
