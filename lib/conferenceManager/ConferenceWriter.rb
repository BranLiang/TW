module ConferenceManager
  class Writer
    def initialize tracks
      @tracks = tracks
    end

    def writeResult(tracks = @tracks)
      File.open("conference_schedule.txt", "w") do |f|
        @tracks.each_with_index do |track, index|
          morning_time = Time.new(2016, 01, 01, 9, 0)
          afternoon_time = Time.new(2016, 01, 01, 1, 0)
          f.puts "Track #{index + 1}:"
          track[:morning_session].each do |talk|
            f.puts "#{morning_time.strftime("%H:%M")}AM" + " " + talk[:title] + " " + "#{talk[:duration]}min"
            morning_time += talk[:duration] * 60
          end
          f.puts "12:00PM Lunch"
          track[:afternoon_session].each do |talk|
            f.puts "#{afternoon_time.strftime("%H:%M")}PM" + " " + talk[:title] + " " + "#{talk[:duration]}min"
            afternoon_time += talk[:duration] * 60
          end
          f.puts "#{afternoon_time.strftime("%H:%M")}PM" + " " + "Networking Event"
        end
      end
    end

  end
end
