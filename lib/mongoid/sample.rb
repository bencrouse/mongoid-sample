require 'mongoid/sample/version'
require 'mongoid'

module Mongoid
  class Criteria
    def sample(n = 1)
      indexes = (0..count - 1).sort_by { rand }.slice(0, n)

      if n == 1
        skip(indexes.first).first
      else
        indexes.map { |i| skip(i).first }
      end
    end
  end
end

module Mongoid
  module Sample
    def sample(*args)
      criteria.sample(*args)
    end
  end
end

Mongoid::Document::ClassMethods.send(:include, Mongoid::Sample)
