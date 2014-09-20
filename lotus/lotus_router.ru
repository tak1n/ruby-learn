require 'lotus/router'

APP = Lotus::Router.new do
  get '/', to: ->(env) { [200, {}, ['Hello World!']] }
end

run APP
