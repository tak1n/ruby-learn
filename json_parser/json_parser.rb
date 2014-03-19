Dir.glob('./lib/*.rb').each do |file|
  require file
end

module JsonParser
  def self.load_io(input)
    tok     = JsonParser::Tokenizer.new input
    parser  = JsonParser::Parser.new tok
    handler = parser.parse
    handler.result
  end

  def self.load(json)
    load_io StringIO.new json
  end
end
