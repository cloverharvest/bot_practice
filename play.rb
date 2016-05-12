require 'http'
require 'json'
require 'eventmachine'
require 'faye/websocket'
# require 'sinatra'


# bot can actually listen to things, let's obtain a websocket url
# starts a real-time messaging session
# does an rtm.start call and we will get back a URL
#
rc = HTTP.post("https://slack.com/api/rtm.start", params: {
  token: ENV['SLACK_API_TOKEN']
})

rc = JSON.parse(rc.body)

url = rc['url']

EM.run do
  ws = Faye::WebSocket::Client.new(url)

  ws.on :open do
    p [:open]
  end

  ws.on :message do |event|
    p [:message, JSON.parse(event.data)]
    data = JSON.parse(event.data)
    if data['text'] == 'hi'
      ws.send({ type: 'message',
        text: "Hello <@#{data['user']}> !",
        channel: data['channel'] }.to_json)
    end
  end

  ws.on :close do
    p [:close, event.code, event.reason]
    ws = nil
    EM.stop
  end
end
