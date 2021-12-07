class ArticlesController < ApplicationController
  include Paginable

  before_action :set_article, only: [:show]

  def index
    paginated = paginate(Article.recent) 

    options = { meta: paginated.meta.to_h, links: paginated.links.to_h }

    render json: serializer.new(paginated.items, options)
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
