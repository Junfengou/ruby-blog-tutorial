class CommentsController < ApplicationController
  http_basic_authenticate_with name: "jou", password: "game", only: :destroy
  def create
    # Since comment model belongs to article model, we need to know which article the incoming comment belongs to
    @article = Article.find(params[:article_id]) # Does Rails automatically fetch this from the url param?
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
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
