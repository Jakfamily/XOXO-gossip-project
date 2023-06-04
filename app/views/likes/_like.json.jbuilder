json.extract! like, :id, :user_id, :likeable_id, :likeable_type, :created_at, :updated_at
json.url like_url(like, format: :json)
