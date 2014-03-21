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
        sep = /\s+/
        source_list = source.split(sep)
        source_list.each do |source|
          tokens << get_token(source)
        end

        tokens
      end

      def get_token(source)
        found_tokens = []
        scanner = StringScanner.new(source)
        TOKENS.each do |pattern, type|
          found = scanner.scan(pattern)
          puts scanner.rest
          if found and type
            found_tokens << [type, found]
          end
        end

        if found_tokens.empty?
          raise "Unknown Token #{source}"
        else
          return found_tokens
        end
      end
      # def next_token(scanner)
        # token = nil

        # TOKENS.each do |pattern, type|
          # found = scanner.scan(pattern)

          # if found and type
            # token = [type, found]
            # break
          # end
        # end

        # token
      # end
    end
  end
end
