ObjectCreator = Object.new
def ObjectCreator.create(&block)
  object = Object.new
  object.instance_eval &block
  object
end

PersonCreator = Object.new
def PersonCreator.create(name)
  ObjectCreator.create do
    instance_variable_set("@name", name)

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
end

BugCreator = Object.new
def BugCreator.create
  ObjectCreator.create do
    def sting(person)
      puts "The bug stings #{person.name}!"
      person.say "Argh!!! Something bit me!"
    end
  end
end

SuperPowers = Proc.new do
  def crawl
    puts "#{name} crawls up the wall"
  end
  def attacked!
    puts "#{name} is attacked but is not affected at all..."
  end
end

aman_king = PersonCreator.create("Aman King")
aman_king.say "Hello everyone"
aman_king.attacked!

peter_kent = PersonCreator.create("Peter Kent")
peter_kent.say "Hey guys!"
peter_kent.say "Today's a good day to attend RubyConf India!"

people = (1..400).collect {|i| PersonCreator.create("Ruby Geek #{i}") }
people[0].say "Hey man, check that girl out... since when are ruby coders so pretty?"

mary_lane = PersonCreator.create("Mary Lane")
mary_lane.say "Hi Peter! Lemme just plug my cord in..."

bugs = (1..10).collect { BugCreator.create }
bugs[0].sting(mary_lane)

peter_kent.say "Hey, let me help you..."

radioactive_bug = BugCreator.create
def radioactive_bug.sting(person)
  puts "The bug stings #{person.name} but #{person.name} feels nothing..."
  person.instance_eval &SuperPowers
end

radioactive_bug.sting(peter_kent)

peter_kent.say "There you go, Mary Lane... you're all set!"
mary_lane.say "Thanks Peter! You're such a sweetheart!"

peter_kent.crawl
peter_kent.attacked!
