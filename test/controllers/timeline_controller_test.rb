require 'test_helper'

class TimelineControllerTest < ActionController::TestCase

    def setup
        @user1 = User.find(1)
        @user2 = User.find(2)
        follower_params = { :follower_id => @user2.id, :followed_user_id => @user1.id }
        article_params = { :title => 'aaa', :text => 'bbbb' }
        @user1.articles.create(article_params)
        Follow.create(follower_params)
        article = Article.where(user_id: 1)
        @sample_response = []
        @sample_response << article[0]
        @sample_response << article[1]      
        log_in_as @user2
    end
    
      
    test "populate should return success" do
        get :populate
        assert_response :success
        assert_equal(assigns(:timeline_articles), @sample_response)
    end

    test "feeds should return success" do
        log_in_as @user1
        get :feeds, user: 1
        assert_response :success
        assert_equal(assigns(:user_articles), @sample_response)
    end
end