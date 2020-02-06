# NflData

This gem is for parsing data from NFL.com and returning a JSON blob that can be used for any fantasy related activities you may wish to pursue.

This was written by @mikesells and @thetizzo

[![Gem Version](https://badge.fury.io/rb/nfl_data.svg)](http://badge.fury.io/rb/nfl_data)

## Installation

Add this line to your application's Gemfile:

    gem 'nfl_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfl_data

## Usage

To use this gem there are some simple calls that can be made.  Everything should return JSON.

### Players

Pull players by position:

```ruby
  NflData::API::Player.get_all

  NflData::API::Player.get_quarterbacks

  NflData::API::Player.get_runningbacks

  NflData::API::Player.get_wide_receivers

  NflData::API::Player.get_tight_ends
```

### Statlines

Pull statlines by week and year:

```ruby
  NflData::API::Statline.get_passing(1, 2014)

  NflData::API::Statline.get_rushing(1, 2014)

  NflData::API::Statline.get_receiving(1, 2014)
```

### Teams

Pull teams by year with or without schedules:

```ruby
  NflData::API::Team.get_all(2014)

  NflData::API::Team.get_all_with_schedule(2014)
```

## Contributing

1. Fork it ( https://github.com/thetizzo/nfl_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
