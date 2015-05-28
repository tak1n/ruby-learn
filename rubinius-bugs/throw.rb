class UncaughtThrowError
end

begin
  throw 'asdf'
rescue => e
  raise "Unproper exception #{e.class} raised" unless e.class == UncaughtThrowError
end
