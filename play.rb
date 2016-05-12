require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'
# require 'sinatra'


#try to get web socket connection
rc = HTTP.post("https://slack.com/api/rtm.start", params: {
  token: ENV['SLACK_API_TOKEN'],
  channel: '#random',
})

rc = JSON.parse(rc.body)

puts rc['url']
