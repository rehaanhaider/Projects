require 'test_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @article = articles(:one)
    log_in_as @user
  end

  
  test "get should return success" do
    get :show, id: 1
    assert_response :success
  end
  
  test "destroy should return success" do
    delete :destroy, id: 1
    assert_redirected_to :articles
  end


  test "index should return success" do
    get :index
    assert_response :success
  end

  test "new should return success" do
    get :new
    assert_response :success
  end

  def teardown
  end
end
