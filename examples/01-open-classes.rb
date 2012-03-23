# ==== common core class extensions from Rails projects ====
class Array  
  def randomize # usage: [1, 2, 3].randomize => [2, 1, 3]
    copy = self.dup
    result = []
    copy.length.times do
      result << copy.slice!(Kernel.rand(copy.length))
    end
    result
  end
end

class Time
  def past? # usage: Time.new.past? => true
    self < Time.now
  end

  def to_milliseconds # usage: Time.new.to_milliseconds => 1268587266671
    (self.to_f * 1000).floor
  end
end

# ==== extract from rspec framework: http://github.com/dchelimsky/rspec/raw/master/lib/spec/expectations/extensions/kernel.rb ====
module Kernel  
  def should(matcher=nil, message=nil, &block) # usage: obj.should == "rubyconf india"
    Spec::Expectations::PositiveExpectationHandler.handle_matcher(self, matcher, message, &block)
  end
    
  def should_not(matcher=nil, message=nil, &block) # usage: obj.should_not == "rubyconf india"
    Spec::Expectations::NegativeExpectationHandler.handle_matcher(self, matcher, message, &block)
  end
end

# ==== extract from test_helper.rb of some Rails projects ====
module Net
  class HTTP
    def self.get(*args)
      raise 'Net::HTTP#get should be stubbed/mocked in unit tests!'
    end
  end
end