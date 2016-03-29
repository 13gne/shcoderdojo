json.array!(@students) do |student|
  json.extract! student, :id, :user_id, :name, :email
  json.url student_url(student, format: :json)
end
