videos = YAML.load_file(File.expand_path('../../config/videos.yml', __FILE__))

videos.each do |video_data|
  video_data = video_data.symbolize_keys!

  if video = Video.find_by_youtube_id(video_data[:youtube_id])
    video.update_attributes(video_data)
  else
    puts "WARNING: Adding video #{video_data[:track_name].inspect} by #{video_data[:artist]}"
    Video.create!(video_data)
  end
end
