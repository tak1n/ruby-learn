# require 'rubinius/debugger'
def boom
  exc = NameError.exception
  # Rubinius::Debugger.start
  require 'debug'
  Rubinius.raise_exception exc
end
begin
  boom
rescue NameError
  puts 'rescued'
end
puts "finished"
