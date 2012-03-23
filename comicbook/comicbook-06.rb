PersonCreator = Object.new
def PersonCreator.create(name)
  person = Object.new
  person.instance_variable_set("@name", name)

  def person.name
    @name
  end

  def person.say(dialog)
    puts "#{name} says, '#{dialog}'"
  end

  def person.attacked!
    puts "#{name} is attacked and gets hurt!!"
  end

  person
end

aman_king = PersonCreator.create("Aman King")
aman_king.say "Hello everyone"
aman_king.attacked!

peter_kent = PersonCreator.create("Peter Kent")
peter_kent.say "Hey guys!"
peter_kent.say "Today's a good day to attend RubyConf India!"

people = (1..400).collect {|i| PersonCreator.create("Ruby Geek #{i}") }
people[0].say "Hey man, check that girl out... since when are ruby coders so pretty?"
