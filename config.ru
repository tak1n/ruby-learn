require 'rack/lobster'
require 'rack/simple_auth'

request_config = {
  'GET' => 'path',
  'POST' => 'params',
  'DELETE' => 'path',
  'PUT' => 'path',
  'PATCH' => 'path'
}

use Rack::SimpleAuth::HMAC::Middleware do |options|
  options.tolerance = 0.02
  options.stepsize  = 0.01

  options.secret = 'test_secret'
  options.signature = 'test_signature'

  # options.logpath = "#{File.expand_path('..', __FILE__)}/logs"
  options.request_config = request_config

  # options.verbose = true
end

class TestMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  end
end

# use TestMiddleware

run Rack::Lobster.new
