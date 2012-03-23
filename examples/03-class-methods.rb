# ==== typical usage: in plugin writing convention ====
# extract from acts_as_taggable_on_steroids plugin: http://github.com/jviney/acts_as_taggable_on_steroids/raw/master/lib/acts_as_taggable.rb

module ActiveRecord #:nodoc:
  module Acts #:nodoc:
    module Taggable #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_taggable
          # ...
          include ActiveRecord::Acts::Taggable::InstanceMethods
          extend ActiveRecord::Acts::Taggable::SingletonMethods
          # ...
        end
        # ...
      end
    end
  end
end
ActiveRecord::Base.send(:include, ActiveRecord::Acts::Taggable)

# example usage
class Post < ActiveRecord::Base
  acts_as_taggable  
end

p = Post.find(:first)
p.tag_list = "Funny, Silly"
p.save
p.tag_list # ["Funny", "Silly"]

Post.find_tagged_with('Funny, Silly')
