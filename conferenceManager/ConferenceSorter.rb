module ConferenceManager
  class Sorter
    attr_reader :tracks
    def initialize(talks, track = ConferenceManager::Track)
      @talks = talks
      @Track = track
      @tracks = tracks_initialize(total_time)
    end

    def fill_tracks
      @tracks.map do |track|
        track.morning_session = fill_session(3)
        track.afternoon_session = fill_session(4)
      end
    end

    private
      def fill_session(hours_limit, talks = @talks)
        session = []
        remain_indexes = []
        talks.each_with_index do |talk, index|
          if duration_pass_time_limit(session.push(talk), hours_limit)
            session.pop
            remain_indexes.push(index)
          end
        end
        @talks = talks.values_at(*remain_indexes)
        return session
      end

      def tracks_initialize(total_time)
        tracks = []
        tracks_num(total_time).times do
          tracks.push(@Track.new)
        end
        tracks
      end

      def tracks_num(total_time)
        total_time/420 + 1
      end

      def total_time(talks = @talks)
        talks.inject(0){ |sum, talk| sum + talk.duration }
      end

      def duration_pass_time_limit(session, hours_limit)
        session_total_time(session) > 60 * hours_limit ? true : false
      end

      def session_total_time(session)
        session.inject(0){ |sum, talk| sum + talk.duration }
      end
  end
end
