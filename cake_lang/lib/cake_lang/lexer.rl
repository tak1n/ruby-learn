%%{

  machine lexer;

  T_KEYWORD_DEF = '->';
  T_KEYWORD_END = '<-';
  T_KEYWORD_OUT = 'stdout';
  T_DQUOTE      = '"';
  T_INT         = ('+'|'-')?[0-9]+;
  T_FLOAT       = ('+'|'-')?[0-9]+'.'[0-9];
  T_LITERAL     = [a-zA-Z][a-zA-Z_]+;
  T_ADD         = '+';
  T_SUB         = '-';
  T_MUL         = '*';
  T_DIV         = '/';
  T_MOD         = '%';
  T_EXP         = '^';
  T_LBR         = '(';
  T_RBR         = ')';
  T_EQ          = '=';
  T_COL         = ',';
  

  main := |*

    T_KEYWORD_DEF => {
      emit(:T_KEYWORD_DEF, data, tokens, ts, te)
    };

    T_KEYWORD_END => {
      emit(:T_KEYWORD_END, data, tokens, ts, te)
    };

    T_KEYWORD_OUT => {
      emit(:T_KEYWORD_OUT, data, tokens, ts, te)
    };

    T_DQUOTE => {
      emit(:T_DQUOTE, data, tokens, ts, te)
    };

    T_INT => {
      emit(:T_INT, data, tokens, ts, te)
    };

    T_FLOAT => {
      emit(:T_FLOAT, data, tokens, ts, te)
    };

    T_LITERAL => {
      emit(:T_LITERAL, data, tokens, ts, te)
    };

    T_ADD => {
      emit(:T_ADD, data, tokens, ts, te)
    };

    T_SUB => {
      emit(:T_SUB, data, tokens, ts, te)
    };

    T_MUL => {
      emit(:T_MUL, data, tokens, ts, te)
    };

    T_DIV => {
      emit(:T_DIV, data, tokens, ts, te)
    };

    T_EXP => {
      emit(:T_EXP, data, tokens, ts, te)
    };

    T_MOD => {
      emit(:T_MOD, data, tokens, ts, te)
    };

    T_LBR => {
      emit(:T_LBR, data, tokens, ts, te)
    };

    T_RBR => {
      emit(:T_RBR, data, tokens, ts, te)
    };

    T_EQ => {
      emit(:T_EQ, data, tokens, ts, te)
    };

    T_COL => {
      emit(:T_COL, data, tokens, ts, te)
    };

    space;

  *|;

}%%

module CakeLang
  class Lexer
      CONVERSION = {
          :T_INT => :to_i,
          :T_FLOAT => :to_f
        }

      %% write data;

      # Lazy way of forwarding instance method calls used internally by Ragel to
      # their corresponding class methods.
      private_methods.grep(/^_lexer_/).each do |name|
        define_method(name) do
          return self.class.send(name)
        end

        private(name)
      end

      def emit(symbol, data, tokens, ts, te)
        value = data[ts..te].pack("c*").strip

        if symbol.eql?(:T_INT) or symbol.eql?(:T_FLOAT)
          value = value.send(CONVERSION[symbol])
        end

        tokens << [symbol, value]
      end

      def lex(data)
        data = data.unpack("c*")
        lexer_start = self.class.lexer_start
        eof = data.length
        tokens = []

        %% write init;
        %% write exec;

        tokens
      end
  end
end
