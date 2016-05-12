require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'
# require 'sinatra'


#test connection with slack
rc = HTTP.post("https://slack.com/api/auth.test", params: {token: ENV['SLACK_API_TOKEN']})

#bot posts a message on slack
rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
  token: ENV['SLACK_API_TOKEN'],
  channel: '#random',
  text: 'Hello from the Schwabs of Benicia!',
  as_user: true
})

puts JSON.pretty_generate(JSON.parse(rc.body))
