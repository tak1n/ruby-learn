File.write 'config.ru', <<-EOS
require 'sinatra/base'
require 'newrelic_rpm'
class Foo < Sinatra::Base
end
run Foo
EOS
Rainbows! do
  use :ThreadPool
  worker_connections 2
end
listen 0
preload_app true
