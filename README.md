# Legendary

Ruby Gem Vulnerability Checker.

Started as a fork of [gemsurance](https://github.com/appfolio/gemsurance)

## Overview

Legendary (Gemsurance) is a tool for monitoring if any of your Ruby Gems are out-of-date or vulnerable. It uses [Bundler](https://github.com/bundler/bundler) and the [Ruby Advisory Database](https://github.com/rubysec/ruby-advisory-db) to do so. It's similar to bundler-audit, but outputs an HTML report and determines which gems are out-of-date as well.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'legendary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install legendary

## Usage

    $ bundle exec legendary

RSpec integration (in your spec/spec_helper.rb)

    require 'legendary/rspec'

in a spec file

```ruby
  describe Project::Application do
    specify { is_expected.to be_secure }
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/jobready/legendary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
