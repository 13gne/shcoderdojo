json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :sequence
  json.url topic_url(topic, format: :json)
end
