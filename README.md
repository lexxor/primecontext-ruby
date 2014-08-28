A ruby client for [Primecontext CRM](https://beta.primecontext.ru).

## Installation

Add this line to your application's Gemfile:

    gem 'primecontext-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install primecontext-ruby

## Usage

Initializing:
```ruby
@api = Primecontext::Api.new(user_id: 'your_user_id', secret_key: 'your_secret_key')
```

New record:
```ruby
@api.new_record(first_name: 'Name', email: 'email@mail.com', your_field: '...')
```
[Available fields](https://beta.primecontext.ru/crm/integration/index/).
