require './conference_manager.rb'

ConferenceManager::Process.new.output

puts File.read('data/conference_schedule.txt')
