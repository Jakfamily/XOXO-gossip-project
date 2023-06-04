json.extract! private_message, :id, :content, :sender_id, :recipient_id, :created_at, :updated_at
json.url private_message_url(private_message, format: :json)
