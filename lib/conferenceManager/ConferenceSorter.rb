module ConferenceManager
  class Sorter
    attr_reader :tracks, :talks
    def initialize talks
      @talks = talks
      @tracks = tracks_initialize(total_time)
    end

    def fill_tracks
      @tracks.map do |track|
        track[:morning_session] = fill_session(3)
        track[:afternoon_session] = fill_session(4)
      end
    end

    private
      def fill_session(hours_limit, talks = @talks)
        session = []
        remain_indexes = []
        talks.each_with_index do |talk, index|
          if duration_over_hours(session.push(talk), hours_limit)
            session.pop
            remain_indexes.push(index)
          end
        end
        @talks = talks.values_at(*remain_indexes)
        return session
      end

      def tracks_initialize(total_time)
        tracks = []
        (total_time/420 + 1).times do
          tracks.push({morning_session: [], afternoon_session: []})
        end
        tracks
      end

      def total_time(talks = @talks)
        talks.inject(0){ |sum, talk| sum + talk[:duration] }
      end

      def duration_over_hours(session, hours_limit)
        return session.inject(0){ |sum, talk| sum + talk[:duration] } > 60 * hours_limit ? true : false
      end
  end
end
