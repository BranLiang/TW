# Conference Tracker Manager

## Approach  
* Make each `talk` a seperate class, which includes `duration` and `title`, this makes the talks extensible and easier if we want to add more stuff and functionality on it.  
* Make each `track` a seperate class, which includes an array of `morning_session` and an array of `afternoon_session`.  
* First read the file and parse the content using the `Regex` expression. All talks will be stored in an array collection called `@talks`. The `Talk` is injected into the `Loader` class for the initialize purpose.  
* Then, during the sorting period. Each talk will try to be inserted to the session. If the session is over the time limit(morning at most 3 hours, afternoon_session at most 4 hours), the last inserted talk will be popped out. At the same time, the talks collection will be sliced if the talk successfully inserted into the session.  
* After got the tracks. The result will be outputted in the `Writer` class. And for the networking, if the afternoon_session ends early than expected, then networking start at 04:00PM, otherwise the networking will start just after the end of the afternoon_session.  
* All procedure will be deployed in the `Process` class.  

## Usage  
* go to the root directory of the project  
`cd thoughtworks`  
* open the ruby interpreter  
`irb`  
* require the main file  
`require "./conferenceManager.rb"`  
* run the command  
`ConferenceManager::Process.new.output`  

## More  
The above process will seek the file in data folder which named with `input.txt`,
if you want to change the file input path. Use the following command  
`ConferenceManager::Process.new("YOU FILE PATH").output`.   
The output file is made to be located at data folder by default.
