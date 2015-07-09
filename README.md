# Penny

Ever wanted to get a penny but they're always out of stock?
Fear no more!
With Penny it's easy to build a bot that monitors the price and availability!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'penny'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'penny'

twenty_two_inches = "http://www.pennyskateboards.com/eu/shop/by-size/penny-original-22.html/"
boards = Penny::Boards.new(twenty_two_inches).all

boards.each do |board|
  if board.available?
    puts "yeay! the #{board.name} is available and it costs #{board.price}. Get it here: #{board.url}"
  else
    puts "nein! the #{board.name} is not available. that makes me a sad panda."
  end
end
```

A Penny::Board responds to:

```ruby
board.name       # => Jojo penny board
board.url        # => http://www.pennyskateboards.com/eu/penny-space-22-inch.html
board.price      # => 49.99 (Float)
board.image      # => http://media.pennyskateboards.com/something.jpg
board.available? # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eljojo/penny. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

