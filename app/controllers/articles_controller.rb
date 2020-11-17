# Class ArticlesController
class ArticlesController < ApplicationController
  # line below will call #set_restaurant method before specified actions
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save!
    # no need for app/views/restaurants/create.html.erb
    redirect_to articles_path(@article)
  end

  def index
    @articles = Article.all
  end

  def show
    # @article = article.find(params[:id])
    # @article.completed ? comp_message = "completed" : comp_message = "not completed yet"

    # @message = "this article is #{comp_message}"
  end

  def edit
    # @article = article.find(params[:id])
  end

  def update
    # @article = article.find(params[:id])
    @article.update(article_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    # no need for app/views/restaurants/create.html.erb
    redirect_to articles_path(@article)
  end

  def destroy
    # @article = article.find(params[:id])
    @article.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
