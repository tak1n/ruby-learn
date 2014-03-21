class CakeLang::Parser

# These are the token types Racc should know about. They are the same as the
# lexer's token types.
token T_INT T_FLOAT T_ADD T_DIV T_MUL T_SUB T_MOD T_EXP T_KEYWORD_DEF T_KEYWORD_END T_EXPRESSION T_RBR T_LBR T_DQUOTE T_COL T_EQL

rule

program
  : defn
  | call
  ;

defn
  : T_KEYWORD_DEF T_EXPRESSION T_LBR T_RBR T_KEYWORD_END { result = [:script, [:defn, val[1]]] }
  ;

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
