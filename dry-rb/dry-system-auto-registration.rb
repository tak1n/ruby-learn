require 'dry/system/container'

class Application < Dry::System::Container
  configure do |config|
    config.root = Pathname('./my/app')

    # Add a 'lib' component dir (relative to `root`), containing class definitions
    # that can be auto-registered
    config.component_dirs.add 'lib'
  end
end

# under /my/app/lib/logger.rb we put
class Logger
  # some neat logger implementation
end

# we can finalize the container which triggers auto-registration
Application.finalize!

# the logger becomes available
Application['logger'].info("Hi")
