# Set proper RACK_ENV if gem is a rack app/middleware
# ENV['RACK_ENV'] = 'test'

# simplecov & coveralls for code coverage
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  project_name 'rack-simple_auth'
  add_filter '/test/'
  add_filter '/pkg/'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/doc/'
end if ENV['COVERAGE']
# only run coverage if ENV['COVERAGE'] is defined

# Include your test dependencies here
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/reporters'

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

# require 'rack/test'
# require 'json'

# Load gem files
require 'gemcext'
