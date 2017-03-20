# Ontraport API

[![Gem Version](https://badge.fury.io/rb/ontraport_api.svg)](http://badge.fury.io/rb/ontraport_api)

A Ruby Client for Ontraport's REST JSON API

<https://api.ontraport.com/doc/>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ontraport_api'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install ontraport_api
```

## Supported APIs

### Objects

```ruby
client.get_object(id, object_id)                              # Get an Object's Data
client.new_object(object_params, object_id)                   # Create new Object
client.update_object(id, object_params, object_id)            # Update Object Details
client.get_objects(search_criteria, object_id)                # Get List of Objects based on Search Criteria
```

### Contacts

```ruby
client.get_contact(id)                                            # Get a Contact's Data
client.new_contact(contact_params)                                # Create new Contact
client.update_contact(id, contact_params)                         # Update Contact Details
client.contact_fields(format)                                     # Fetch Contact Meta Fields
client.replace_sequences_for_contact(id, sequence_ids)            # Replace Sequences (Array / String) for Contact
client.add_sequences_to_contact(id, sequence_ids)                 # Add Sequences (Array / String) to Contact
client.add_sequences_to_contacts(sequence_ids, contacts_criteria) # Add Sequences (Array / String) to Selected Contacts
client.add_tags_to_contact(id, tag_ids)                           # Add Tags (Array / String) to Contact
client.add_tags_to_contacts(tag_ids, contacts_criteria)           # Add Tags (Array / String) to Selected Contacts
client.remove_tags_from_contacts(tag_ids, contacts_criteria)      # Remove Tags from Selected Contacts
client.get_contacts(search_criteria)                              # Get List of Contacts based on Search Criteria
client.get_contacts_by_<field_name>(value)                        # Wildcard alias to client.get_contacts("<field_name> = 'value'")
```

### Tags

```ruby
client.get_tags(conditions)                 # Get Tags by condition
client.new_tag(tag_name)                    # Create new Tag with tag_name
client.get_tags_by_<field_name>(value)      # Wildcard alias to client.get_tags("<field_name> = 'value'")
```

### Sequences

```ruby
client.get_sequences(conditions)                # Get all sequences
client.get_sequences_by_<field_name>(value)     # Wildcard alias to client.get_sequences("<field_name> = 'value'")
```

See <https://api.ontraport.com/doc/> on details of parameters.

## Usage

Basic example:

```ruby
require 'ontraport_api'

client = OntraportApi::Client.new('app-id','app-key')

search_results = client.get_contacts("email = 'me@jimmyngu.com' AND lastname = 'Ngu'")
puts search_results

# Error handling
puts search_results['error']    # true if error
puts search_results['message']  # API response body when error
```

Finding Contacts:

```ruby
contact = client.get_contacts_by_email('me@jimmyngu.com').first
contact = client.get_contacts_by_city('Kuala Lumpur').first
contact = client.get_contacts_by_sms_number('+60123456789').first
```

Create New Contact:

```ruby
contact = client.new_contact({ firstname: 'Jimmy', lastname: 'Ngu', email: 'me@jimmyngu.com' })
puts 'Success' if contact['error'].nil?
```

Adding Tags to Contacts:

```ruby
tag_name = 'Customer'
tag = client.get_tags_by_tag_name(tag_name).first
if tag.nil?
    tag = client.new_tag(tag_name)
end

result = client.add_tags_to_contacts(tag['tag_id'], { ids: contact['id'] })
puts 'Success' if result['error'].nil?

# Multiple tags & contacts
client.add_tags_to_contacts('<tag_id_1>,<tag_id_2>,<tag_id_3>', { ids: '<contact_id_1>,<contact_id_2>,<contact_id_3>' })

# Tag contacts with conditions
client.add_tags_to_contacts('<tag_id>', "city = 'Kuala Lumpur'" )
```

Adding Sequence to Contact:

```ruby
sequence = client.get_sequences_by_name('Sales Funnel')
result = client.add_sequences_to_contact(contact['id'], sequence['drip_id'])
puts 'Success' if result['error'].nil?
```

## Contributing

1. Fork it ( <https://github.com/jimmynguyc/ontraport_api/fork> )
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

### v0.4.0

- Rename `#add_sequences_to_contact` to `#replace_sequences_for_contact` since that's what it does
- Added `#add_sequences_to_contact` and `#add_sequence_to_contact` since the endpoints are available now
- Breaks v0.3.1 implementation

### v0.3.1

- Deprecated `#add_sequence_to_contact` in favor of `#add_sequences_to_contact` (note the extra `s`) since it did not trigger sequence immediately
- Breaks v0.2.2 implementation

### v0.2.2

- Added generic Object query

### v0.2.0

- Return ['data'] as default (breaking v0.1 implementations with ['data'])

### v0.1.1

- Add Contact Sequence API

### v0.1.0

- Fix bug on PUT methods
- Fix bug on add / remove Contact Tags
- Bump minor version

### v0.0.4

- Add Tags API
- Wildcard field_name search
- Error handling with error message hash

### v0.0.3

- Add Sequences API

### v0.0.1

- Contacts API
