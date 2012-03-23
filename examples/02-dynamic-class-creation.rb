# ==== when testing modules / plugins ====
class ValidatesLengthOfTest < Test::Unit::TestCase # example: testing Validatable plugin http://validatable.rubyforge.org/
  # ...
  test "given is constraint, when validated, then error is in the objects error collection" do
    klass = Class.new do
      include Validatable
      attr_accessor :name
      validates_length_of :name, :is => 2
    end

    instance = klass.new
    instance.valid?
    assert_equal "is invalid", instance.errors.on(:name)
  end
  # ...
  test "given within constraint, when validated, then valid is true" do
    klass = Class.new do
      include Validatable
      attr_accessor :name
      validates_length_of :name, :within => 2..4
    end

    instance = klass.new
    instance.name = "bk"
    assert_equal true, instance.valid?
  end
end

# ==== when still evolving behavior but starting off with basics... ====
class SearchController < ApplicationController
  SortOption = Struct.new(:sort_key, :sort_url)
  ResultsViewObject = Struct.new(:results, :sort_option) do
    def sort_url
     sort_option.sort_url
    end

    def total_count
     results.total_count
    end
  end
  # ...
end