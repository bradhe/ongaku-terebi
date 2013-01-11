class Video < ActiveRecord::Base
  attr_accessible :youtube_id, :artist, :track_name

  # Returns a random video from the catalog.
  #
  # @return [Video] a video
  #
  def self.random
    order('RANDOM()').first
  end

  # Returns a random video, except for one that has an ID that is passed in
  # here.
  #
  # @return [Video] a random video
  #
  def self.random_except(*ids)
    where('id NOT IN (?)', ids.flatten).random
  end

  def title
    "#{artist}: #{track_name}"
  end
end
