puts "$LOAD_PATH before require"
$LOAD_PATH.each do |path|
  puts path
end

require 'stackprof'

puts "$LOAD_PATH after require"
$LOAD_PATH.each do |path|
  puts path
end

StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu-myapp.dump') do
  1000.times do
    1 + 1
  end
end
