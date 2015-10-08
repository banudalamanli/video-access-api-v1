json.array!(@videos) do |video|
  json.extract! video, :id, :title, :description, :directors, :actors
  json.url video_url(video, format: :json)
end
