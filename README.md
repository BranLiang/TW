# Conference Track Mangager

## Usage
go to the root directory of the project  
`cd thoughtworks`  
open the ruby interpreter  
`irb`  
require the main file  
`require "./conferenceManager.rb"`  
run the command  
`ConferenceManager::Process.new.output`  

## More  
The above process will seek the file in data folder which named with `input.txt`,
if you want to change the file input path. Use the following command
`ConferenceManager::Process.new("YOU FILE PATH").output`. The output file is made to be located at data folder by default.
