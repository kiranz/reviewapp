json.extract! hotel, :id, :name, :description, :rating, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)