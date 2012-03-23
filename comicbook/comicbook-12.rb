ObjectCreator = Object.new
def ObjectCreator.create(&block)
  object = Object.new
  object.instance_eval &block if block
  def object.extend(behavior)
    instance_eval &behavior
  end
  object
end

InstantiableBehavior = ObjectCreator.create do
  def new(&block)  
    ObjectCreator.create do
      instance_variable_set("@instance_behavior", block)
      def new(*args)
        instance = ObjectCreator.create(&@instance_behavior)
        instance.init(*args) if instance.respond_to?(:init)
        instance
      end
    end
  end
end

ExtendableBehavior = ObjectCreator.create do
  def new(&block)
    Proc.new(&block)
  end
end

Person = InstantiableBehavior.new do
  def init(name)
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

Bug = InstantiableBehavior.new do
  def sting(person)
    puts "The bug stings #{person.name}!"
    person.say "Argh!!! Something bit me!"
  end
end

SuperPowers = ExtendableBehavior.new do
  def crawl
    puts "#{name} crawls up the wall"
  end
  def attacked!
    puts "#{name} is attacked but is not affected at all..."
  end
end

MutantBugBehavior = ExtendableBehavior.new do
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
