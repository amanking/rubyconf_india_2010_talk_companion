class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def say(dialog)
    puts "#{name} says, '#{dialog}'"
  end

  def attacked!
    puts "#{name} is attacked and gets hurt!!"
  end
end

class Bug
  def sting(person)
    puts "The bug stings #{person.name}!"
    person.say "Argh!!! Something bit me!"
  end
end

module SuperPowers
  def crawl
    puts "#{name} crawls up the wall"
  end
  def attacked!
    puts "#{name} is attacked but is not affected at all..."
  end
end

module MutantBugBehavior
  def sting(person)
    puts "The bug stings #{person.name} but #{person.name} feels nothing..."
    person.extend SuperPowers
  end
end

aman_king = Person.new("Aman King")
aman_king.say "Hello everyone"
aman_king.attacked!

peter_kent = Person.new("Peter Kent")
peter_kent.say "Hey guys!"
peter_kent.say "Today's a good day to attend RubyConf India!"

people = (1..400).collect {|i| Person.new("Ruby Geek #{i}") }
people[0].say "Hey man, check that girl out... since when are ruby coders so pretty?"

mary_lane = Person.new("Mary Lane")
mary_lane.say "Hi Peter! Lemme just plug my cord in..."

bugs = (1..10).collect { Bug.new }
bugs[0].sting(mary_lane)

peter_kent.say "Hey, let me help you..."

radioactive_bug = Bug.new
radioactive_bug.extend MutantBugBehavior

radioactive_bug.sting(peter_kent)

peter_kent.say "There you go, Mary Lane... you're all set!"
mary_lane.say "Thanks Peter! You're such a sweetheart!"

peter_kent.crawl
peter_kent.attacked!
