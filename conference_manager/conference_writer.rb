module ConferenceManager
  class Writer
    def initialize tracks
      @tracks = tracks
    end

    def writeResult(tracks = @tracks)
      File.open("./data/conference_schedule.txt", "w") do |f|
        @tracks.each_with_index do |track, index|
          morning_time = Time.new(2016, 01, 01, 9, 0)
          afternoon_time = Time.new(2016, 01, 01, 1, 0)
          f.puts "Track #{index + 1}:"
          track.morning_session.each do |talk|
            f.puts "#{morning_time.strftime("%H:%M")}AM" + " " + talk.title + " " + talk_duration(talk)
            morning_time += talk.duration * 60
          end
          f.puts "12:00PM Lunch"
          track.afternoon_session.each do |talk|
            f.puts "#{afternoon_time.strftime("%H:%M")}PM" + " " + talk.title + " " + talk_duration(talk)
            afternoon_time += talk.duration * 60
          end
          f.puts networking(afternoon_time)
        end
      end
    end

    private
      def networking time
        time_limit = Time.new(2016, 01, 01, 4, 0)
        normal = "#{time.strftime("%H:%M")}PM" + " " + "Networking Event"
        edge_case = "04:00PM" + " " + "Networking Event"
        time > time_limit ? normal : edge_case
      end

      def talk_duration(talk)
        talk.duration == 5 ? "" : "#{talk.duration}min"
      end

  end
end
