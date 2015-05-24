require 'sinatra/base'
require 'newrelic_rpm'
class Foo < Sinatra::Base
end
run Foo
