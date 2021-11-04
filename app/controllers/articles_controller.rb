class ArticlesController < ApplicationController
  # every time the user do something like delete a post, it will ask for authentication
  http_basic_authenticate_with name: "jou", password: "game", except: [:index, :show]
  def index
    @articles = Article.all # assigning every articles in the Article model to @articles
  end

  def show # show a single article based on the passed in id
    @article = Article.find(params[:id]) # url will pass down an id as param, we can directly throw it in here and tell the model to find the id
  end

  # When you visit [localhost:3000/articles/new] this is the controller that is linked to that page
  def new
    @article = Article.new
  end

  # This method only run on form submission when user attempt to create a new blog post
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # This fires when the user visit the page
  def edit
    @article = Article.find(params[:id])
  end

  # This fires after form onSubmit
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    # Telling the HTML that only these two fields are permitted onSubmit
    # This check happens immediately after form submission
    params.require(:article).permit(:title, :body, :status)
  end

end
