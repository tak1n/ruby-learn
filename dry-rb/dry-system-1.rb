require "dry/system/container"

class Application < Dry::System::Container
  configure do |config|
    config.root = Pathname("./my/app")
  end
end

# now you can register a logger
require "logger"
Application.finalize!
Application.register("utils.logger", Logger.new($stdout))

# and access it
Application["utils.logger"].info("Hi")
