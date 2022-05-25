require 'test_helper'

class UsersControllerTest < ActionController::TestCase

    def setup
      @user = User.find(1)
      @user2 = User.find(2)
    end
  
    
    test "get should return success" do
      post :create, user: {
            name: 'aaa',
            email: 'a@b.com',
            password: '123456'
        }
      assert_equal "Welcome to the app!", flash[:success] 
    end

    test "index should return success" do
      log_in_as @user
      get :index
      assert_equal(assigns(:users), [@user2]) 
    end
    
    test "show should return success" do
      log_in_as @user
      get :show, id: 1
      assert_equal(assigns(:user), @user) 
    end
  
    def teardown
    end
  end