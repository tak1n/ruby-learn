# config.ru
require 'lotus'

module OneFile
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index'
      end
    end
  end

  module Controllers
    module Home
      include Lotus::Controller

      action 'Index' do
        def call(params)
        end
      end
    end
  end

  module Views
    module Home
      class Index
        include Lotus::View

        def render
          'Hello'
        end
      end
    end
  end
end

run OneFile::Application.new
