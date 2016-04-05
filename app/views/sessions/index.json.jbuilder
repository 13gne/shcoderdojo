json.array!(@sessions) do |session|
  json.extract! session, :id, :course_id, :session_date, :notes
  json.url session_url(session, format: :json)
end
