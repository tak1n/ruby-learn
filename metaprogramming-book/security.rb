# read user input
user_input = gets()

print "\n"
puts "Tainted?: #{user_input.tainted?}"
puts user_input
print "\n"

eval user_input #evals the string -> executes code

$SAFE = 1

eval user_input #Safe evel of 1 prevents from evaluating (eval)