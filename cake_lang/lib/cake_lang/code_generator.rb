module CakeLang
  module CodeGenerator
    class C
      def self.compile(ast)
        @output = <<-EOF
int
main (void)
{
EOF
        case ast.first
        when :script
          compile_call(ast[1])
        else
          raise "Error"
        end
@output += <<-EOF
  return 0;
}
EOF
      end

      def self.compile_call(node)
        case node.first
        when :call
          @output += "#{node[1]}();\n"
        when :defn
          @output += "void #{node[1]}() {}\n"
        else
          raise "Error"
        end
      end
    end
  end
end
