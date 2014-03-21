class CakeLang::Parser

# These are the token types Racc should know about. They are the same as the
# lexer's token types.
token T_INT T_FLOAT 
token T_ADD T_DIV T_MUL T_SUB T_MOD T_EXP T_EQL
token T_KEYWORD_DEF T_KEYWORD_END 
token T_EXPRESSION 
token T_RBR T_LBR T_DQUOTE T_COL

rule

program
  : defn
  | call
  ;

defn
  : T_KEYWORD_DEF T_EXPRESSION T_LBR arglist T_RBR T_KEYWORD_END { result = [:script, [:defn, val[1], [:arglist, val[3]]]] }
  ;

arglist
  : T_EXPRESSION
  | T_EXPRESSION T_COL T_EXPRESSION {
      result = []
      val.each do |value|
        result << value unless value.eql?(',')
      end
    }

call
  : T_EXPRESSION T_LBR T_RBR { result = [:script, [:call, val[0]]] }
  | T_EXPRESSION { result = [:script, [:call, val[0]]] }
  ;

end

---- inner

  def parse(tokens)
    @tokens = tokens

    do_parse
  end

  #
  # Returns the next token to process
  # @return [Array]
  #
  def next_token
    @tokens.shift
  end
