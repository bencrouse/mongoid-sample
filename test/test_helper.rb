$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mongoid/sample'

require 'minitest/autorun'

Mongoid.configure do |config|
 config.connect_to('mongoid_sample_test')
end

class MiniTest::Test
  def before_setup
    Mongoid.purge!
  end
end
