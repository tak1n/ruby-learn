%%{
  machine test;

  main := |*
    '>>>' => { puts '>>>' };
    any+  => { puts "any: #{data[ts...te]}" };
  *|;

}%%

%% write data;

def run_lexer(data)
  # data = data.unpack("c*") if(data.is_a?(String))
  eof = data.length
  token_array = []

  %% write init;
  %% write exec;
end


run_lexer("asdf")
run_lexer(">>>")
