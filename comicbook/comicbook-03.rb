def create_person(name)
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

aman_king = create_person("Aman King")
aman_king.say "Hello everyone"
aman_king.attacked!

peter_kent = create_person("Peter Kent")
peter_kent.say "Hey guys!"
