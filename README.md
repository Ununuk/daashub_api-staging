# DaashubAPI

A Ruby interface to [Contact Enhance API](https://gist.github.com/weemanjz/bb558858ce5d2e33ce08).

## Documentation

https://gist.github.com/weemanjz/bb558858ce5d2e33ce08

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daashub_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daashub_api

## Usage

Contact Enhance API v1 uses Token Based Authentication, so you'll need to [register your account on Contact Enhance](https://www.contactenhance.com). Then you will be assigned an API Token. Now you can configure a Daashub client.

```ruby
client = DaashubAPI::Client.new('your_api_token')
```

When you use invalid API token `DaashubAPI::UnauthorizedError` will be raised.

Once you've configured a `client`, you can do following things.

**Get an account info**

```ruby
account = client.account_info

account.records_left # 50
account.renewal_date # 2016-03-04 12:00:44 UTC
```

**Get companies data**

```ruby
companies = client.companies(where: { domain: 'www.example.com' }, limit: 2)

companies.error? # false
companies.daashub_fields # ['email']
companies.map &:email # ['katie@example.com', 'robert@example.com']

companies = client.companies

companies.error? # true
companies.errors # ["Where can't be blank"]
```

**Get requests history**

```ruby
history = client.requests(from: Date.yesterday, order: :desc, limit: 2)

history.item_count # 2
history.total_count # 9

requests = history.items
requests[0].query # 'where=domain==www.example.com'
requests[0].sent_at # 2016-08-09 10:59:56 UTC
requests[0].item_count # 1

companies = requests[0].items

companies[0].email # 'katie@example.com'
```

## Supported Ruby Versions

This library was currently tested against `Ruby 2.3` only. It may work on other Ruby versions, however it wasn't tested against them yet.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/weemanjz/daashub_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

