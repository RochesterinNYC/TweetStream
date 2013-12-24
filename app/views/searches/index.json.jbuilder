json.array!(@searches) do |search|
  json.extract! search, :keywords, :latitude, :longitude, :radius, :results_summary
  json.url search_url(search, format: :json)
end
