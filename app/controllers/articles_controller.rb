class ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    #@article.inspect
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    #render plain: params[:article].inspect
  end

  def edit
  end

  def show
    @article = Article.find(params[:id])
  end
  
  private 
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
