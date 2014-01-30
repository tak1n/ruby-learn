require 'minitest/autorun'
require 'minitest/pride' # for colored output

# my gem bootstrap file
require_relative '../lib/rack/blogengine.rb'

if __FILE__ == $0
  $LOAD_PATH.unshift('lib', 'spec')
  Dir.glob('./spec/**/*_spec.rb') { |f| require f }
end
