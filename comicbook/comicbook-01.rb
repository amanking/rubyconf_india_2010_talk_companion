aman_king = Object.new
def aman_king.say(dialog)
  puts "Aman King says, '#{dialog}'"
end
def aman_king.attacked!
  puts "Aman King is attacked and gets hurt!!"
end

aman_king.say "Hello everyone"
aman_king.attacked!
