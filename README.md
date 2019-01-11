# ActionMailing

ActionMailing allows you to represent emails as plain Ruby classes which complement ActionMailer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'actionmailing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install actionmailing

## Usage

Define a mailing:

```ruby
class WelcomeMailing
  include ActionMailing::Mailing

  def
    "to@example.com"
  end
  
  def from
    "from@example.com"
  end
  
  def subject
    "Welcome #{user.name}"
  end

  def initialize(user)
    @user = user
  end

  private

  attr_reader :user
end
```

Calling the mailing from the mailer:

```ruby
class UserMailer < ActionMailer::Base
  include ActionMailing::Mailer

  # No need to call `mail`, just return a Mailing
  def welcome(user)
    WelcomeMailing.new(user)
  end
end
```

Send the mail in the usual way:

```ruby
WelcomeMailer.welcome(user).deliver_later
```

## How it Works

There isn't any magic in ActionMailing. It doesn't modify any of Rails internal
behaviour. `ActionMailing::Mailer` simply adds an `around_action` hook to
call `mail` automatically.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Unit Testing

Mailings are plain Ruby classes, so are easy to test with your preferred framework.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/actionmailing.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
