module CakeLang
  module Lexer
    class << self
      TOKENS = {
        /def/       => :T_KEYWORD_DEF,
        /end/       => :T_KEYWORD_END,
        /"/         => :T_DQUOTE,
        /\w+/       => :T_EXPRESSION,
        /\+/        => :T_ADD,
        /\-/        => :T_SUB,
        /\*/        => :T_MUL,
        /\//        => :T_DIV,
        /\%/        => :T_MOD,
        /\^/        => :T_EXP,
        /\(/        => :T_LBR,
        /\)/        => :T_RBR,
        /\d+\.+\d*/ => :T_FLOAT,
        /\d+/       => :T_INT,
        /\=/        => :T_EQ,
        /\,/        => :T_COL,
        /\s+/       => nil
      }

      def lex(source)
        tokens = []
        scanner = StringScanner.new(source)
        
        until scanner.eos?
          token = next_token(scanner)
          tokens << token if token
        end

        tokens
      end

      def next_token(scanner)
        token = nil

        TOKENS.each do |pattern, type|
          found = scanner.scan(pattern)

          if found and type
            token = [type, found]
            break
          end
        end

        token
      end
    end
  end
end
