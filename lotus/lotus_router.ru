require 'lotus/router'

class FlowersController
  class Index
    def call(env)
      [200, {}, ['Hello World!']]
    end
  end
end

router = Lotus::Router.new
router.get '/', to: 'flowers#index'

run router
