class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.recent

    render json: serializer.new(@articles)
  end

  def show
    render json: @article
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def serializer
    ArticleSerializer
  end
end
