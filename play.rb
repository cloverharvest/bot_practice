require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'
# require 'sinatra'


# bot can actually listen to things, let's obtain a websocket url
# starts a real-time messaging session
# does an rtm.start call and we will get back a URL

rc = HTTP.post("https://slack.com/api/rtm.start", params: {
  token: ENV['SLACK_API_TOKEN']
})

rc = JSON.parse(rc.body)

url = rc['url']




# Thread.new do
#   EM.run do
#   end
# end
#
# get '/' do
#   if params['code']
#
#     rc = HTTP.post("https://slack.com/api/oauth.access", params: {
#       client_id: ENV['SLACK_CLIENT_ID'],
#       client_secret: ENV['SLACK_CLIENT_SECRET'],
#       code: params['code']
#     })
#
#     rc = JSON.parse(rc)
#
#     token = rc['bot'][bot_access_token]
#
#     rc = HTTP.post("https://slack.com/api/rtm.start", params: {
#       token: token
#     })
#
#     rc = JSON.parse(rc.body)
#
#     url = rc['url']
#
#     ws = Faye::WebSocket::Client.new(url)
#
#     ws.on :open do
#       p [:open]
#     end
#
#     ws.on :message do |event|
#       p [:message, JSON.parse(event.data)]
#       data = JSON.parse(event.data)
#       if data['text'] == 'hi'
#       ws.send({ type: 'message',
#         text: "Hello <@#{data['user']}>!",
#         channel: data['channel'] }.to_json)
#       end
#     end
#
#     ws.on :close do |event|
#       p [:close, event.code, event.reason]
#       ws = nil
#       EM.stop
#     end
#
#     "Bot successfully installed"
#   else
#     "Hello World"
#   end
# end
