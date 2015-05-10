# OntraportApi

[![Gem Version](https://badge.fury.io/rb/ontraport_api.svg)](http://badge.fury.io/rb/ontraport_api)

A Ruby Client for Ontraport's REST JSON API 

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

## Supported APIs

### Contacts

```ruby
client.get_contact(id)                          # Get a Contact's Data
client.new_contact(contact_params)              # Create new Contact
client.update_contact(id, contact_params)       # Update Contact Details
client.contact_fields(format)                   # Fetch Contact Meta Fields
client.add_tags(tag_ids, contacts_criteria)     # Add Tags to Selected Contacts
client.remove_tags(tag_ids, contacts_criteria)  # Remove Tags from Selected Contacts
client.get_contacts(search_criteria)            # Get List of Contacts based on Search Criteria
```

### Sequences

```ruby
client.get_sequences    # Get all sequences
```

See https://api.ontraport.com/doc/ on details of parameters.

Note: Products API not available yet at the new JSON API.

## Contributing

1. Fork it ( https://github.com/jimmynguyc/ontraport_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## TODO Lists

- Forms API
- Transactions API
- Messages API
- Tasks API

## Release Notes

#### v0.0.3
- Add Sequences API

#### v0.0.1
- Contacts API
