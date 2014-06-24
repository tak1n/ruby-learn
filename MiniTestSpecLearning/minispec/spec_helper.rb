gem 'minitest'

require 'minitest/autorun'
require 'minitest/reporters'
require 'zombie'

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class Minitest::SharedExamples < Module
  include Minitest::Spec::DSL
end
