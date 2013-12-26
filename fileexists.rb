if File.exist?("/var/www/index.php")
  puts "file exists with File.exist"
end

if File.exists?("/var/www/index.php")
  puts "file exists with File.exists"
end 
