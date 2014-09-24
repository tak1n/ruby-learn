require 'http_router'

APP = HttpRouter.new do
  get('/hi').to { |env| [200, {'Content-type' => 'text/html'}, ["Hello World!\n"]]}
end

run APP
