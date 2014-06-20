task :console do
  require 'irb'
  require 'irb/completion'
  require 'gemcext'
  ARGV.clear
  IRB.start
end
