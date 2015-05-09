# OntraportApi

A Ruby-lang wrapper for Ontraport's REST JSON API 

https://api.ontraport.com/doc/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ontraport_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ontraport_api

## Usage

Basic example: 

```ruby
require 'ontraport_api'

client = OntraportApi::Client.new('app-id','app-key')

search_results = client.get_contacts({ search: 'me@jimmyngu.com' })
puts search_results['data']
```

## Supported API

### Contacts

```ruby
client.get_contact(id)
client.new_contact(contact_params)
client.update_contact(contact_params)
client.contact_fields(format)
client.add_tags(tag_ids, contacts_criteria)
client.remove_tags(tag_ids, contacts_criteria)
client.get_contacts(search_criteria)
```

See https://api.ontraport.com/doc/ on details of parameters.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ontraport_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
