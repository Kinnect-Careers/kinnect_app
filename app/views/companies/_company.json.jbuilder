json.extract! company, :id, :name, :email, :image_url, :created_at, :updated_at
json.url company_url(company, format: :json)
