require "dry/system/container"

class Application < Dry::System::Container
  configure do |config|
    config.root = Pathname("./my/app")
  end
end


require "logger"
Application.register("logger", Logger.new($stdout))
Application.finalize!
Application.register("logger2", Logger.new($stdout))

Application["logger"].info("Hi")
Application["logger2"].info("Hi")

Import = Application.injector

# In a class definition you simply specify what it needs
class PostPublisher
  include Import["logger"]

  def call(post)
    # some stuff
    logger.debug("post published: #{post}")
  end
end

PostPublisher.new.call("stuff")
