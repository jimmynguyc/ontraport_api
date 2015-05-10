module OntraportApi
  module APIs
    module Contacts
      CONTACTS_OBJECT_ID = 0
      CONTACTS_API_METHODS_AND_PATHS = {
        'get_contact'                 => [:get,     '/object'],
        'new_contact'                 => [:post,    '/objects'],
        'update_contact'              => [:put,     '/objects'],
        'get_contacts'                => [:get,     '/objects'],
        'contact_fields'              => [:get,     '/objects/meta'],
        'add_tags_to_contacts'        => [:put,     '/objects/tag'],
        'remove_tags_from_contacts'   => [:delete,  '/objects/tag']
      }

      def get_contact(id)
        query_contacts({id: id})
      end

      def new_contact(payload = {})
        query_contacts(payload)
      end

      def update_contact(id, payload = {})
        query_contacts(payload.merge(id: id))
      end

      def contact_fields(format = {})
        default_format = { format: 'byId' }
        format = default_format.merge(format)
        query_contacts(format)
      end

      def add_tags_to_contacts(tag_ids, conditions = {})
        default_conditions = {
          performAll: true,
          sortDir: 'asc',
          searchNotes: 'true'
        }
        tag_ids = tag_ids.is_a?(Array) ? tag_ids.join(',') : tag_ids
        query_contacts(conditions.merge({ add_list: tag_ids }))
      end

      def remove_tags_from_contacts(tag_ids, conditions = {})
        default_conditions = {
          performAll: true,
          sortDir: 'asc',
          searchNotes: 'true'
        }
        tag_ids = tag_ids.is_a?(Array) ? tag_ids.join(',') : tag_ids
        query_contacts(conditions.merge({ add_list: tag_ids }))
      end

      def get_contacts(conditions = {})
        conditions = { condition: conditions } if conditions.is_a? String
        default_conditions = {
          performAll: true,
          sortDir: 'asc',
          searchNotes: 'true'
        }
        payload = default_conditions.merge(conditions)
        query_contacts(payload)
      end

      def query_contacts(payload)
        method, path = CONTACTS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload.merge({ objectID: CONTACTS_OBJECT_ID }))
      end

    end
  end
end
