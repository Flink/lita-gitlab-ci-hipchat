# lita-gitlab-ci-hipchat

[![Build Status](https://travis-ci.org/Flink/lita-gitlab-ci-hipchat.svg?branch=develop)](https://travis-ci.org/Flink/lita-gitlab-ci-hipchat) [![Coverage Status](https://img.shields.io/coveralls/Flink/lita-gitlab-ci-hipchat.svg)](https://coveralls.io/r/Flink/lita-gitlab-ci-hipchat)

Receive and display nicely web hooks from GitLab CI in HipChat.

## Installation

Add lita-gitlab-ci-hipchat to your Lita instance's Gemfile:

``` ruby
gem 'lita-gitlab-ci-hipchat'
```


## Configuration

```ruby
Lita.configure do |config|
  # The API token for your bot’s user
  config.handlers.gitlab_ci_hipchat.api_token = 'token'
  # The room to be notified (HipChat name, not JID)
  config.handlers.gitlab_ci_hipchat.room      = 'my_room'
end
```

## Usage

This handler add a HTTP route at `/gitlab-ci`. So you have to add a web
hook pointing to that URL (http://lita-bot.tld/gitlab-ci).

## License

[MIT](http://opensource.org/licenses/MIT)
