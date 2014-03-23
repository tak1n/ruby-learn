module CakeLang
  class Lexer
      TOKENS = {
        /->/          => :T_KEYWORD_DEF,
        /<-/          => :T_KEYWORD_END,
        /stdout/      => :T_KEYWORD_OUT,
        /"/           => :T_DQUOTE,
        /\d+\.+\d*/   => :T_FLOAT,
        /\d+/         => :T_INT,
        /\w+/         => :T_LITERAL,
        /\+/          => :T_ADD,
        /\-/          => :T_SUB,
        /\*/          => :T_MUL,
        /\//          => :T_DIV,
        /\%/          => :T_MOD,
        /\^/          => :T_EXP,
        /\(/          => :T_LBR,
        /\)/          => :T_RBR,
        /\=/          => :T_EQ,
        /\,/          => :T_COL,
        /\s+/         => nil
      }

      CONVERSION = {
        :T_INT => :to_i,
        :T_FLOAT => :to_f
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
            if type.eql?(:T_INT) or type.eql?(:T_FLOAT)
              found = found.send(CONVERSION[type])
            end
            token = [type, found]
            break
          end
        end

        token
      end
  end
end
