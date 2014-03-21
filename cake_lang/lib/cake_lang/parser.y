class CakeLang::Parser

# These are the token types Racc should know about. They are the same as the
# lexer's token types.
token T_INT T_FLOAT
token T_ADD T_DIV T_MUL T_SUB T_MOD T_EXP T_EQL
token T_KEYWORD_DEF T_KEYWORD_END T_KEYWORD_OUT
token T_LITERAL
token T_RBR T_LBR T_DQUOTE T_COL

rule

program
  : defn { result = [:program, val[0]] }
  # | call { result = [:program, val[0]] }
  ;

defn
  : T_KEYWORD_DEF T_LITERAL T_LBR arglist T_RBR method_definition T_KEYWORD_END { 
      result = [:defn, val[1], val[3], val[5]]
    }
  ;

arglist
  : T_LITERAL T_COL T_LITERAL {
      result = [:arglist]
      val.each do |value|
        result << value unless value.eql?(',')
      end
    }
  | /* none */ { result = [:arglist, nil] }

method_definition
  : operation { result = [:inner, val[0]] }
  | T_KEYWORD_OUT operation { result = [:inner, val[0], val[1]] }
  ;

operation
  : var T_ADD var { result = [:op, val[1].to_sym, val[0], val[2]] }
  | var T_SUB var { result = [:op, val[1].to_sym, val[0], val[2]] }
  | var T_MUL var { result = [:op, val[1].to_sym, val[0], val[2]] }
  | var T_DIV var { result = [:op, val[1].to_sym, val[0], val[2]] }
  | var T_MOD var { result = [:op, val[1].to_sym, val[0], val[2]] }
  | var T_EXP var { result = [:op, val[1].to_sym, val[0], val[2]] }
  ;

var
  : T_LITERAL
  | T_INT { result = [:int, val[0]] }
  | T_FLOAT { result = [:float, val[0]] }
  ;

# call
  # : T_LITERAL T_LBR T_RBR { result = [:call, val[0]] }
  # | T_LITERAL { result = [:call, val[0]] }
  # ;

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
