module CakeLang
  module CodeGenerator
    class C
      def self.compile(ast)
        @output = <<-EOF
#include<stdio.h>

int
main (void)
{
EOF
        program_ast = ast[1]
        compile_nodes(program_ast)

@output += <<-EOF
  return 0;
}
EOF
      end

      def self.compile_nodes(program_ast)
        case program_ast.first
        when :call
          @output += "#{program_ast[1]}();\n"
        when :defn
          #@output += "void #{program_ast[1]}() {\n"

          @output += compile_inner_method(program_ast[3])

          #@output += "}\n"
        else
          raise "Error"
        end
      end

      def self.compile_inner_method(method_ast)
        if method_ast[1].eql?('stdout')
          outputter= '%d'
          return "printf(\"#{outputter}\", #{compile_operation(method_ast[2])});\n"
        else
          return "#{compile_operation(method_ast[1])}\n"
        end
      end

      def self.compile_operation(op_ast)
        operation = op_ast[1]
        return op_ast[2][1].send(operation, op_ast[3][1])
      end
    end
  end
end
