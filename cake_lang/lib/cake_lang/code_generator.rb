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
        ast.each do |node|
          unless node.eql? :program
            compile_nodes(node[1])
          end
        end

@output += <<-EOF
  return 0;
}
EOF
      end

      def self.compile_nodes(node)
        case node.first
        when :call
          @output += "#{node[1]}();\n"
        when :defn
          #@output += "void #{program_ast[1]}() {\n"

          @output += compile_inner_method(node[3])

          #@output += "}\n"
        else
          raise "Error"
        end
      end

      def self.compile_inner_method(ast)
        result = []

        ast.each do |block_ast|
          next if block_ast.eql? :block
          block_ast.each do |method_ast|
            if method_ast[1][1].eql?('stdout')
              outputter= {
                :int => '%d',
                :float => '%f'
              }

              format = method_ast[1][2][1][0]
              operation = method_ast[1][2]

              if operation.first.eql? :div
                format = :float
              end

              result << "printf(\"#{outputter[format]}\", #{compile_operation(operation)});\n"
            elsif method_ast[1].first.eql? :equal
              result << "#{compile_assignment(method_ast[1])};\n"
            else
              operation = method_ast[1][1]

              result << "#{compile_operation(operation)};\n"
            end
          end
        end

        result.join
      end

      def self.compile_operation(op_ast)
        operation_table = {
          :add => :+,
          :sub => :-,
          :mul => :*,
          :div => :/,
          :exp => :^,
          :mod => :%
        }

        operation = operation_table[op_ast[0]]
        op1 = op_ast[1][1]
        op2 = op_ast[2][1]

        if operation.eql? :/
          op1 = op1.to_f
          op2 = op2.to_f
        end

        result = op1.send(operation, op2)
      end

      def self.compile_assignment(ass_ast)
        type = ass_ast[2][0]
        identifier = ass_ast[1]
        value = ass_ast[2][1]

        return "#{type} #{identifier} = #{value}"
      end
    end
  end
end
