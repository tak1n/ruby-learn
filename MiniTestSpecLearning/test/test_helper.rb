require 'zombie'

testfolder = File.dirname(__FILE__)

Dir.glob("#{testfolder}/shared/**/*.rb").each do |f|
  require f
end
