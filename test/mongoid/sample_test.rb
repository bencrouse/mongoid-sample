require 'test_helper'

class Mongoid::SampleTest < Minitest::Test
  class Foo
    include Mongoid::Document
    field :name, type: String
  end

  def test_that_it_has_a_version_number
    refute_nil ::Mongoid::Sample::VERSION
  end

  def test_providing_a_random_document_on_empty_collection
    assert(Foo.all.sample.nil?)
  end

  def test_providing_a_random_document
    Foo.create!
    assert(Foo.all.sample.present?)
  end

  def test_providing_multiple_documents
    5.times { Foo.create! }
    result = Foo.all.sample(5)

    assert(result.length == 5)
    assert(result.all?(&:present?))
  end

  def test_sample_without_scope
    5.times { Foo.create! }
    result = Foo.sample(5)

    assert(result.length == 5)
    assert(result.all?(&:present?))
  end

  def test_sample_respecting_scope
    Foo.create!(name: 'foo')
    assert(Foo.where(name: 'bar').sample.nil?)
    assert(Foo.where(name: 'foo').sample.present?)
  end
end
