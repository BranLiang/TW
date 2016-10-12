module ConferenceManager
  class Track
    attr_accessor :morning_session, :afternoon_session
    def initialize
      @morning_session = []
      @afternoon_session = []
    end
  end
end
