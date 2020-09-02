# NflData

This gem is for parsing data from NFL.com and returning a JSON blob that can be used
for any fantasy related activities you may wish to pursue.

**However** since NFL.com has updated their website to a much more difficult to parse version,
this gem is now going to be using [MySportsFeeds API](https://www.mysportsfeeds.com/data-feeds/) instead.

Thanks to the people at [MySportsFeeds](https://www.mysportsfeeds.com) for providing an affordable
service for this type of data.  If you would like to use this gem I encourage you to head over to their
website and sign up for an account.

This gem was written by @mikesells and @thetizzo

[![Gem Version](https://badge.fury.io/rb/nfl_data.svg)](http://badge.fury.io/rb/nfl_data)

## Installation

Add this line to your application's Gemfile:

    gem 'nfl_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfl_data

## Configuration

Configuration for [MySportsFeeds API](https://www.mysportsfeeds.com/data-feeds/) credentials
can be set with the following Environment Variables:

```
MYSPORTSFEEDS_API_KEY
MYSPORTSFEEDS_API_HOST
MYSPORTSFEEDS_API_VERSION
```

### MySportsFeeds API Docs

https://www.mysportsfeeds.com/data-feeds/api-docs/

I've written this to use >= v2.1 of the MSF API.

## Usage

To use this gem there are some simple calls that can be made.  Everything will return JSON.

### Players

Pull players by position. Not passing a position param will pull all players.

Position param is passed through to MySportsFeeds and can be any value they accept.  Please see
their docs above.

```ruby
  NflData::API::Player.new.players(position: "qb")
```

#### Example Response

```json
{
  "players": [
    {
      "first_name": "John",
      "last_name": "Elway",
      "full_name": "John Elway",
      "position": "QB",
      "number": 7,
      "team": "DEN",
      "msf_player_id": 12345,
      "image_source":""
    },
    ...
  ]
}
```

### Statlines

Pull statlines by week and year:

```ruby
  NflData::API::Statline.new.statlines(year: 2020, week: 1)
```

#### Example Response

```json
{
  "statlines": [
    {
      "rush_atts": 2,
      "rush_yards": 11,
      "rush_tds": 1,
      "fumbles": 0,
      "pass_comp": 11,
      "pass_att": 23,
      "pass_yards": 123,
      "pass_tds": 2,
      "ints": 1,
      "qb_rating": 92.6,
      "receptions": 3,
      "rec_yards": 10,
      "rec_tds": 0,
      "msf_game_id": 51465,
      "msf_player_id": 6826
    }
    ...
  ]
}
```

### Schedule

Pull season schedule by year:
```ruby
  NflData::Api::Schedule.new.season(year: 2020)
```

#### Example Response

```json
{
  "games": [
    {"week":1,"away_team":"HOU","home_team":"KC","start_time":"2020-09-10T04:25:00.000Z"}
    ...
  ]
}
```

## Contributing

1. Fork it ( https://github.com/thetizzo/nfl_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
