require 'lotus/router'

app = Lotus::Router.new do
    get '/', to: ->(env) { [200, {}, ['Welcome to Lotus::Router!']] }
end

Rack::Server.start app: app
