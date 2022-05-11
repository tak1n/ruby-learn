require "dry/system/container"
require "logger"

class Core < Dry::System::Container
  register("logger", Logger.new($stdout))
  register("logger2", Logger.new($stdout))
end

class MyApp < Dry::System::Container
  import(from: Core, as: :core)
end

Core["logger"].info("hi")

MyApp.import(from: Core, as: :core2)
# MyApp.import(keys: ["logger2"], from: Core, as: :core2)
MyApp.finalize!

MyApp["core.logger2"].info("hi")
MyApp["core2.logger2"].info("hi")

