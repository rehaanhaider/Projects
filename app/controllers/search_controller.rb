class SearchController < ApplicationController

    before_filter :session_expires
    before_filter :update_session_time

    def index
        query = params[:search]
        if query
            @response = Article.search(query)
        end
    end
end