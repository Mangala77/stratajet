json.array!(@not_ams) do |not_am|
  json.extract! not_am, :id, :notam_data, :text
  json.url not_am_url(not_am, format: :json)
end
