require 'csv'

class VideoArchive
  include Enumerable

  attr_reader :csv

  def initialize(file_name)
    @csv = CSV.read(file_name, col_sep: "\t", headers: true)
  end

  def each(&blk)
    @csv.each do |row|
      blk.call(row.to_hash)
    end
  end
end
