require 'lotus/router'

class FlowersController
  class Index
    def call(env)
      [200, {}, ['Hello from Lotus!']]
    end
  end
end

router = Lotus::Router.new
router.get '/flowers', to: 'flowers#index'

Rack::Server.start app: router, Port: 2306
