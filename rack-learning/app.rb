require 'rack'

class RackApp
  def self.call(env)
    [200, {"Content-Type" => "text/json"}, ["{\"test\": \"value\"}"]]
  end
end

# Run rack apps in custom .rb file
Rack::Server.start app: RackApp

# or use a custom handler
# Rack::Handler::Thin.run RackApp
