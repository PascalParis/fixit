json.extract! provider, :id, :name, :address, :email, :phone_number, :presentation, :range, :photo, :created_at, :updated_at
json.url provider_url(provider, format: :json)
