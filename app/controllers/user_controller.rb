class UserController < ApplicationController
  def articles
    #list all post of an author
    user = User.find(params[:id])
    @articles = user.articles
    
    render 'articles/index'
  end
end