json.extract! opportunity, :id, :title, :requirements, :description, :tasks, :company_id, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
