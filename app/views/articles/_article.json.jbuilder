json.extract! article, :id, :name, :title, :description, :created_at, :updated_at
json.url article_url(article, format: :json)
