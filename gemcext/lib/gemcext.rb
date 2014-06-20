# require gem files here
require "gemcext/version"
require "gemcext/combie"

# require third party libraries here
require 'json'

module Gemcext
  # Your code goes here...
  # hmmm bundler says so, but i say your "helper" methods which are gem wide (used in tests & lib files) should go here
  # or if your gem code is really small..

  extend self
  # Method to return Gem Root Dir
  # @return [String] Gem Root Folder
  def root
    ::File.dirname(::File.expand_path('..', __FILE__))
  end
end
