# NflData

This gem is for parsing data from NFL.com and returning a JSON blob that can be used for any fantasy related activities you may wish to pursue.

This was written by @mikesells and @thetizzo

## Installation

Add this line to your application's Gemfile:

    gem 'nfl_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfl_data

## Usage

### Players

To pull players you can do so by position as follows:

```ruby
  NflData::API::Player.get_quarterbacks

  NflData::API::Player.get_runningbacks

  NflData::API::Player.get_wide_receivers

  NflData::API::Player.get_tight_ends
```

These will return JSON blobs of available players at each position

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nfl_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
