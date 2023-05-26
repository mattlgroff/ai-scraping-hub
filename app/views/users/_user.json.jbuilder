json.extract! user, :id, :email, :name, :provider, :uid, :oauth_token, :encrypted_api_key, :created_at, :updated_at
json.url user_url(user, format: :json)
