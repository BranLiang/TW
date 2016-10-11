require_relative "conferenceManager/version"
require_relative "conferenceManager/ConferenceLoader"
require_relative "conferenceManager/ConferenceSorter"
require_relative "conferenceManager/ConferenceWriter"

module ConferenceManager
  class Process
    FILE = "../data/input.txt"
    def initialize(file = FILE, loader = ConferenceManager::Loader, sorter = ConferenceManager::Sorter, writer = ConferenceManager::Writer)
      @file = file
      @loader = loader
      @sorter = sorter
      @writer = writer
    end

    def output
      talks = @loader.new(@file).readfile
      sorter = @sorter.new(talks)
      sorter.fill_tracks
      @writer.new(sorter.tracks).writeResult
    end
  end

end

ConferenceManager::Process.new.output


# test code
# file = "../data/input.txt"
# loader = ConferenceManager::Loader.new(file)
# talks = loader.readfile
# sorter = ConferenceManager::Sorter.new(talks)
#
# sorter.fill_tracks
# puts sorter.tracks
# puts "............"
# puts sorter.tracks[0]
#
# writer = ConferenceManager::Writer.new(sorter.tracks)
# writer.writeResult
