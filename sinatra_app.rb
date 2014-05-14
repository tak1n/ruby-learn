require 'sinatra'

set :port => 9292
set :bind => 'localhost'

get '/' do
  'hi sinatra'
end
