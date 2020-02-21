# KawaiiAssociation

An ActiveRecord DSL extension that provides kawaii association syntax.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kawaii_association'
```

And then execute:

    $ bundle install


## Usage

This gem extends Active Record association definition methods to take a block:

```ruby
class Post < ActiveRecord::Base
  has_many do
    comments
  end

  has_one do
    category dependent: :nullify
  end

  belongs_to do
    blog touch: true
    author
  end
  ...
end
```


## Contributing

Pull requests are welcome on GitHub at https://github.com/amatsuda/kawaii_association.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
