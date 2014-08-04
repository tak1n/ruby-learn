require 'erb'
require 'router'

class App
  class << self
    attr_accessor :root
  end

  def call(env)
    Router.route(env["REQUEST_PATH"])
  end
end

App.root = File.dirname(__FILE__)
