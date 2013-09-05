# demoman


[![Build Status](https://travis-ci.org/webdestroya/demoman.png)](https://travis-ci.org/webdestroya/demoman)
[![Code Climate](https://codeclimate.com/github/webdestroya/demoman.png)](https://codeclimate.com/github/webdestroya/demoman)
[![Coverage Status](https://coveralls.io/repos/webdestroya/demoman/badge.png)](https://coveralls.io/r/webdestroya/demoman)

Demoman allows you to extract metadata from Half-Life and Half-Life 2 demo (.dem) files.

## Installation

    $ gem install demoman


And add the gem to your Gemfile:

    gem 'demoman'


## Usage

```ruby
# Load a file
demo_object = Demoman.from_file("test/test.dem")

# OR Load from a string
demo_object = Demoman.from_string("##DEMO_DATA##")


# Server IP Address
puts demo_object.server_address


# Player who recorded the demo
puts demo_object.player_name

# The map being played
puts demo_object.map

# The game directory (dod, tf2, ...)
puts demo_object.game_dir

# The duration of the demo (in seconds)
puts demo_object.duration

# The number of ticks in the demo
puts demo_object.ticks

# The total number of frames
puts demo_object.frames
```



## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## License

GPLv3

## Copyright

Copyright (c) 2013 Mitch Dempsey. See LICENSE for details.
