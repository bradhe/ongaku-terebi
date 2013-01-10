class Video < ActiveRecord::Base
  attr_accessible :youtube_id, :artist, :track_name

  # Returns a random video from the catalog.
  #
  # @return [Video] a video
  #
  def self.random
    where('id <= ?', rand(maximum('id')) + 1).first
  end

  # Returns a random video, except for one that has an ID that is passed in
  # here.
  #
  # @return [Video] a random video
  #
  def self.random_except(*ids)
    n = rand(maximum('id')) + 1
    where('(id <= ? OR id >= ?) AND id NOT IN (?)', n, n, ids.flatten).first
  end

  def title
    "#{artist}: #{track_name}"
  end
end
