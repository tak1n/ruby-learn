#!/usr/bin/env ruby

require 'rubinius/profiler' if RUBY_ENGINE == 'rbx'

# Count and print the lines in a file.
def count_lines(file)
  count = 0
  file.each_line do |line|
    count += 1
  end
  puts "#{count} lines"
end

# Main program: process ARGV or stdin
if ARGV.empty?
  count_lines $stdin
else
  ARGV.each do |filename|

    if RUBY_ENGINE == 'rbx'
      profiler = Rubinius::Profiler::Instrumenter.new
      profiler.start
    end

    File.open(filename) { |file| count_lines file }

    if RUBY_ENGINE == 'rbx'
      profiler.stop
      profiler.show
    end
  end
end
