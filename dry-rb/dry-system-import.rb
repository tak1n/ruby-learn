require "dry/system/container"
require "logger"

class Core < Dry::System::Container
  configure do |config|
  end
end

Core.register("logger", Logger.new($stdout))

class MyApp < Dry::System::Container
  import(from: Core, as: :other)
end

Core["logger"].info("hi")

MyApp.finalize!
MyApp.import(from: Core, as: :other2)

MyApp["other.logger"].info("hi")
MyApp["other2.logger"].info("hi")

