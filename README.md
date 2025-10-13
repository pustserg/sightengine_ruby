# SightengineRuby

This gem provides a convenient way to interact with the [Sightengine API](https://sightengine.com/) for content moderation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sightengine_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sightengine_ruby

## Usage

First, configure the client with your API user and secret. You can do this in an initializer file (e.g., `config/initializers/sightengine.rb`):

```ruby
SightengineRuby.configure do |config|
  config.api_user = 'YOUR_API_USER'
  config.api_secret = 'YOUR_API_SECRET'
end
```

Then, you can create a client instance:

```ruby
client = SightengineRuby::Client.new
```

And make requests to the API. For example, to check an image for nudity:

```ruby
response = client.check('nudity', 'https://example.com/image.jpg')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pustserg/sightengine_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/pustserg/sightengine_ruby/blob/master/CODE_OF_CONDUCT.md).
