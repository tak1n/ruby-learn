require 'erb'
require 'router'

class App
  def call(env)
    Router.route(env["REQUEST_PATH"])
  end
end
