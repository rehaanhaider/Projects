class TimelineController < ApplicationController

    before_action :logged_in_user
    before_filter :session_expires
    before_filter :update_session_time

    def populate        
        @followers = User.find(current_user.id).followings
        @timeline_articles = []
        Article.find_each do |article|
            @followers.each do |follower|
                if article.user_id == follower.id
                    @timeline_articles << article
                end
            end
        end
    end

    def feeds
        @user_articles = User.find(params[:user]).articles
    end

end