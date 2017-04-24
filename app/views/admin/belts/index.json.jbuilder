json.array!(@belts) do |belt|
  json.extract! belt, :id, :name, :sequence
  json.url belt_url(belt, format: :json)
end
