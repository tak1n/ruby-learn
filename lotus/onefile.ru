require 'lotus'

module OneFile
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index'
      end
    end

    load!
  end

  module Controllers
    module Home
      include OneFile::Controller

      action 'Index' do
        def call(params)
        end
      end
    end
  end

  module Views
    module Home
      class Index
        include OneFile::View

        def render
          template 'home/index'
        end
      end
    end
  end
end

run OneFile::Application.new
