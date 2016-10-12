module ConferenceManager
  class Loader
    def initialize path, talk = ConferenceManager::Talk
      @path = path
      @talks = []
      @Talk = talk
    end

    def readfile(path = @path)
      File.readlines(path).each do |line|
        duration = line.match(/\d+/).to_s.to_i
        duration = 5 if duration == 0 # for lignting talks
        title = line.match(/\D+/)[0].to_s.strip
        @talks.push(@Talk.new(duration, title))
      end
      @talks
    end
  end
end
