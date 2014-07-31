ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

if ENV['COVERAGE']
  SimpleCov.start 'rails'
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Minitest
require 'minitest/reporters'
require 'capybara/rails'

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  fixtures :all

  include MyCustomHelper

  # Make sure to clear ActionMailer deliveries after each testcase
  # def teardown
    # ActionMailer::Base.deliveries.clear
  # end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

class FeatureJavaScriptTest < ActionDispatch::IntegrationTest
  Capybara.javascript_driver = :webkit

  def setup
    Capybara.current_driver = Capybara.javascript_driver
  end

  def teardown
    Capybara.current_driver = Capybara.default_driver
    # Make sure to clear ActionMailer deliveries after each testcase
    # ActionMailer::Base.deliveries.clear
  end
end

# Make all database transactions use the same thread
# needed for feature / integration tests with headless browser (javascript tests) because they are not running in the same thread
ActiveRecord::ConnectionAdapters::ConnectionPool.class_eval do
  def current_connection_id
    Thread.main.object_id
  end
end
