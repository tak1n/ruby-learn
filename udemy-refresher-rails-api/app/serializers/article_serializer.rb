class ArticleSerializer
  include JSONAPI::Serializer

  set_type :articles
  attributes :title, :content, :slug
end
