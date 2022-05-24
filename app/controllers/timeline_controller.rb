class TimelineController < ApplicationController

    before_action :logged_in_user
    before_filter :session_expires
    before_filter :update_session_time

    def populate
        
        @user = User.find(current_user.id)
        articles = Article.all
        @followers = @user.followings
        @timeline_articles = []
        articles.each do |article|
            @followers.each do |follower|
                if article.user_id == follower.id
                    @timeline_articles << article
                end
            end
        end

        @final_articles = []
        @timeline_articles.each do |article|
            id = article[:user_id]
            name = User.find(id).name
            article = article.attributes
            article['username'] = name
            @final_articles << article
        end
    end

    def feeds
        @user = User.find(params[:user])
        @user_articles = @user.articles
    end

end
