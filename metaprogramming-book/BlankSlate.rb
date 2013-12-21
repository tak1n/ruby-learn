class Computer
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^method_missing$|^respond_to\?$/
  end
end

# Blank Slate
# undefs all methods expect some essential ones
# Blank Slate has lesser available methods than a basic Object