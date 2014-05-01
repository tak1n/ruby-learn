# require 'rubinius/profiler'

# profiler = Rubinius::Profiler::Instrumenter.new
# result   = profiler.start

run lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello from test"]] }

# at_exit do
  # profiler.stop

  # File.open('/tmp/profile.txt', 'w') do |handle|
    # profiler.flat(handle)
  # end
# end
