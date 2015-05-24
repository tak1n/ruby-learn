large_file  = File.join(File.dirname(__FILE__), 'large.txt')

large_handle  = File.open(large_file, 'r')

large_handle.each_byte {}
large_handle.rewind
