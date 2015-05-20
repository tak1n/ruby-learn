# puts -> Kernel.puts -> $stdout.puts
# If you have to test a cli and don't want your tests to output the puts texts or test them you have to change the $stdout
# Per default $stdout is referencing to STDOUT
#
#
# I/O streams are located under the /dev/fd directory. Files there are given a number, known as a file descriptor. The operating system provides three streams by default. They are:
#
# Standard input (/dev/fd/0)
# Standard output (/dev/fd/1)
# Standard error (/dev/fd/2)

p $stdout == STDOUT
p $stdout.class
p $stdout.fileno # => IO.new(1), File descriptior 1

Kernel.puts "this goes to stdout"

# Use /dev/null if you don't wanna receive anything via Kernel.gets or output anything via Kernel.puts
fd = IO.sysopen('/dev/null', 'w+')
$stdout = IO.new(fd)
Kernel.puts "this doesn't appear"
$stdout = STDOUT # Don't forget to set $stdout to the normal STDOUT stream again (fd = 1, /dev/fd/1)

# For testing input, output you can change $stdout to a double or StringIO
#
# $stdout = double("io", puts: nil)
# $stdout = StringIO.new

require 'stringio'
io = StringIO.new

$stdout = io
puts "hi"
$stdout = STDOUT

io.rewind
puts "StringIO contains written string: #{io.read == "hi\n"}"


# Read more at
# http://www.freebsd.org/doc/en/books/design-44bsd/overview-io-system.html
# https://robots.thoughtbot.com/io-in-ruby
