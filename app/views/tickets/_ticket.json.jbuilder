json.extract! ticket, :id, :name, :address, :price, :email_address, :phone_number, :seat_id_seq, :event_id, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
