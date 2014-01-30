require 'minitest/autorun'
require 'minitest/pride' # for colored output
require "test_notifier/runner/minitest" # for notifier

require_relative '../lib/<path to bootstrap file>/<bootstrap.rb>'
# alternative to require_relative
# rake install in gem dir and then
# require 'mygem'

if __FILE__ == $0
  $LOAD_PATH.unshift('lib', 'test')
  Dir.glob('./test/**/*_test.rb') { |f| require f }
end

