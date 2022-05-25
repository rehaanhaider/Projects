require 'test_helper'

class FollowControllerTest < ActionController::TestCase

    def setup
      @user = User.find(1)
      @user2 = User.find(2)
      log_in_as @user2
    end
  
    
    test "create should return success" do
      post :create, {
        follower_id: 1,
        followed_user_id: 2
      }
      assert_equal(assigns(:user), @user) 
    end

    test "show should return success" do
        get :show
        assert_equal(assigns(:followers), @user2.followers) 
    end

    def teardown
    end
  end