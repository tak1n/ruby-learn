require 'angelo'
require 'angelo/tilt/erb'

class Foo < Angelo::Base
  include Angelo::Tilt::ERB

  get '/' do
    erb :index
  end

  # render wss for production, ws for dev
  get '/assets/js/application.js' do
    content_type :js
    @scheme = ENV['RACK_ENV'] == 'production' ? 'wss://' : 'ws://'
    erb :application
  end

  websocket '/default' do |ws|
    websockets[:default] << ws

    ws.on_message do |msg|
      message = JSON.parse(msg)
      ws.write({ handle: message['handle'], text: message['text'] }.to_json)
    end
  end
end

Foo.run
