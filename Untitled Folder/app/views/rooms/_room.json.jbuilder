json.extract! room, :id, :name, :codename, :company, :location, :capacity, :condition, :status, :created_at, :updated_at
json.url room_url(room, format: :json)
