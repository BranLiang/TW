module ConferenceManager
  class Talk
    attr_reader :duration, :title
    def initialize(duration, title)
      @duration = duration
      @title = title
    end
  end
end
