require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @user = User.find(1)
    @article = Article.find(1)
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
