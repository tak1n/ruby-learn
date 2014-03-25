%%{
  machine test;

  main := |*
    '>>>' => { puts '>>>' };
    any+  => { puts "any: #{data[ts...te].pack("c*")}" };
  *|;

}%%

%% write data;

def run_lexer(data)
  data = data.unpack("c*")
  eof = data.length

  %% write init;
  %% write exec;
end


run_lexer("asdf")
run_lexer(">>>")
