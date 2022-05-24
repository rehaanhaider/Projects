require 'actionpack/action_caching'

class ArticlesController < ApplicationController

  before_action :logged_in_user
  before_filter :session_expires
  before_filter :update_session_time

  def index
    @articles = Article.where(user_id: current_user.id)
  end

  def new
    @article = current_user.articles.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @article = @user.articles.create(article_params)
    if @article.save
      followers = @user.followers
      follower_map = followers.map { |item| item[:email] }
      NotificationJob.perform_later(follower_map, @user.name)
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def expand
    @user = params[:user_id]
    @article = Article.find(params[:id])
  end


private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
