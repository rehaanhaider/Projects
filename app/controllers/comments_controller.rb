class CommentsController < ApplicationController

    before_action :logged_in_user
    before_filter :session_expires
    before_filter :update_session_time

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end



