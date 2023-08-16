json.extract! product, :id, :name, :details, :created_at, :updated_at
json.url product_url(product, format: :json)
