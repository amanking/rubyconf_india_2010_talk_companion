aman_king = Object.new
def aman_king.say(dialog)
  puts "Aman King says, '#{dialog}'"
end
def aman_king.attacked!
  puts "Aman King is attacked and gets hurt!!"
end

aman_king.say "Hello everyone"
aman_king.attacked!

peter_kent = Object.new
def peter_kent.say(dialog)
  puts "Peter Kent says, '#{dialog}'"
end
def peter_kent.attacked!
  puts "Peter Kent is attacked and gets hurt!!"
end

peter_kent.say "Hey guys!"
