inc = Proc.new { |x| x + 1 }
# more code ...
puts inc.call(2)

#Blocks are not objects... 
#Procs are Blocks turned into Objects and can be created but called later
#This is called defered evaluation