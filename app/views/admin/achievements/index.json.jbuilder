json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :topic_id, :belt_id
  json.url achievement_url(achievement, format: :json)
end
