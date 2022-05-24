class FollowController < ApplicationController

    before_action :logged_in_user
    before_filter :session_expires
    before_filter :update_session_time


    def create
        @user = User.find(params[:follower_id])
        followed_user_id = params[:followed_user_id]
        @follow = Follow.create(follower_params)
        @follow.save
        redirect_to @user
    end

    def show
        @followers = User.find(current_user.id).followers
    end


    def following
        @status = current_user.followings.include?(
            User.find(params[:user_id]))
        render plain: current_user.followings.include?(
            User.find(params[:user_id]))
    end

    def followings
        @users = current_user.followings
    end

    

    private
        def follower_params
            params.permit(:follower_id, :followed_user_id)
        end

    end
