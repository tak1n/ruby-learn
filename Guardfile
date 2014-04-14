# Sample Guardfile
guard :minitest do
  watch(%r{^test/(.*)\/?(.*)\_test.rb$}) do |m|
    "test/#{m[1]}#{m[2]}_test.rb"
  end

  watch(%r{^lib/(.*)\/(.*).rb$}) do |m|
    "test/#{m[1]}/#{m[2]}_test.rb"
  end
end
