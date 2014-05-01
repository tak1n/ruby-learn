require 'rack/lobster'
require 'rack/simple_auth'

request_config = {
  'GET' => 'path',
  'POST' => 'params',
  'DELETE' => 'path',
  'PUT' => 'path',
  'PATCH' => 'path'
}

class TestMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  end
end

use TestMiddleware
use Rack::SimpleAuth::HMAC::Middleware do |options|
  options.tolerance = 5000

  options.secret = 'test_secret'
  options.signature = 'test_signature'

  # options.logpath = "#{File.expand_path('..', __FILE__)}/logs"
  options.request_config = request_config

  # options.verbose = true
end

run Rack::Lobster.new
