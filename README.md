# Ontraport API

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

search_results = client.get_contacts({ condition: "email = 'me@jimmyngu.com'" })
puts search_results['data']

# Error handling
puts search_results['error']    # true if error
puts search_results['message']  # API response body when error
```

## Supported APIs

### Contacts

```ruby
client.get_contact(id)                                        # Get a Contact's Data
client.new_contact(contact_params)                            # Create new Contact
client.update_contact(id, contact_params)                     # Update Contact Details
client.contact_fields(format)                                 # Fetch Contact Meta Fields
client.add_tags_to_contacts(tag_ids, contacts_criteria)       # Add Tags to Selected Contacts
client.remove_tags_from_contacts(tag_ids, contacts_criteria)  # Remove Tags from Selected Contacts
client.get_contacts(search_criteria)                          # Get List of Contacts based on Search Criteria
client.get_contacts_by_<field_name>(value)                    # Wildcard alias to client.get_contacts("<field_name> = 'value'")
```

### Tags (experimental)

```ruby
client.get_tags(conditions)                 # Get Tags by condition
client.new_tag(tag_name)                    # Create new Tag with tag_name
client.get_tags_by_<field_name>(value)      # Wildcard alias to client.get_tags("<field_name> = 'value'")
```

### Sequences (experimental)

```ruby
client.get_sequences(conditions)                # Get all sequences
client.get_sequences_by_<field_name>(value)     # Wildcard alias to client.get_sequences("<field_name> = 'value'")
```

### Contact Sequences (experimental)

```ruby
client.add_sequence_to_contact(sequence_drip_id, contact_id)    # Add Sequence to Contact
```

See https://api.ontraport.com/doc/ on details of parameters.

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
- Products API


## Experimental / Missing Endpoints

Many element endpoints are experimental since the JSON API is so new and documentation is lacking in general. I'm working with the "objects" API endpoint mostly for those. Will update as they become available.

Otherwise, they're missing because I haven't got to them yet. Check the TODO list and let me know if I've missed anything.


## Release Notes

#### v0.1.1
- Add Contact Sequence API

#### v0.1.0
- Fix bug on PUT methods
- Fix bug on add / remove Contact Tags
- Bump minor version

#### v0.0.4
- Add Tags API
- Wildcard field_name search
- Error handling with error message hash

#### v0.0.3
- Add Sequences API

#### v0.0.1
- Contacts API
