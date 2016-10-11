module ConferenceManager
  class Loader
    def initialize path
      @path = path
      @talks = []
    end

    def readfile(path = @path)
      File.readlines(path).each do |line|
        duration = line.match(/\d+/).to_s.to_i
        duration = 5 if duration == 0 # for lignting talks
        title = line.match(/\D+/)[0].to_s.strip
        @talks.push({duration: duration, title: title})
      end
      @talks
    end
  end
end
