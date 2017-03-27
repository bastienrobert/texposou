json.extract! exhibition, :id, :name, :description, :opening_at, :closing_at, :artists_max, :area_left, :area_max, :price_per_day_per_area, :created_at, :updated_at
json.url exhibition_url(exhibition, format: :json)
