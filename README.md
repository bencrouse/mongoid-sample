# Mongoid::Sample

Brings the API of Ruby's Array#sample to Mongoid collections


## Installation

Add this line to your application's Gemfile:

    gem 'mongoid-sample'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid-sample

And require:

    require 'mongoid/sample'

## Usage

### Sample a single document

```ruby
require 'mongoid/sample'

class MyModel
  include Mongoid::Document
  field :name
end

puts MyModel.sample.inspect # => nil
5.times { MyModel.create(name: 'Foo') }
puts MyModel.sample.inspect # => #<MyModel _id: 57954c1002182308d7000000, name: "Foo">
```

### Sample multiple documents

```ruby
require 'mongoid/sample'

class MyModel
  include Mongoid::Document
  field :name
end

puts MyModel.sample(3).inspect # => []
5.times { MyModel.create(name: 'Foo') }
puts MyModel.sample(3).inspect # => [#<MyModel _id: 57954c6f02182308d7000008, name: "Foo">, #<MyModel _id: 57954c6f02182308d700000a, name: "Foo">, #<MyModel _id: 57954c6f02182308d7000009, name: "Foo">]
```

### Sample from scope

```ruby
require 'mongoid/sample'

class MyModel
  include Mongoid::Document
  field :name
end

puts MyModel.where(name: 'Foo').sample(3).inspect # => []
5.times { MyModel.create(name: 'Foo') }
5.times { MyModel.create(name: 'Bar') }
puts MyModel.sample(3).inspect # => [#<MyModel _id: 57954c6f02182308d7000007, name: "Foo">, #<MyModel _id: 57954c6f02182308d7000008, name: "Foo">, #<MyModel _id: 57954ca702182308d700000e, name: "Bar">]
puts MyModel.where(name: 'Foo').sample(3).inspect # => [#<MyModel _id: 57954c6f02182308d7000008, name: "Foo">, #<MyModel _id: 57954c6f02182308d7000009, name: "Foo">, #<MyModel _id: 57954c6f02182308d7000006, name: "Foo">]
```
