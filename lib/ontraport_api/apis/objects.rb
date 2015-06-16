module OntraportApi
  module APIs
    module Objects
      OBJECTS_API_METHODS_AND_PATHS = {
        'get_object'                 => [:get,     '/object'],
        'new_object'                 => [:post,    '/objects'],
        'update_object'              => [:put,     '/objects'],
        'get_objects'                => [:get,     '/objects']
      }

      def get_object(id, object_id)
        query_objects({id: id}, object_id)
      end

      def new_object(payload = {}, object_id)
        query_objects(payload, object_id)
      end

      def update_object(id, payload = {}, object_id)
        query_objects(payload.merge(id: id), object_id)
      end

      def get_objects(conditions = {}, object_id)
        conditions = { condition: conditions } if conditions.is_a? String
        default_conditions = {
          performAll: true,
          sortDir: 'asc',
          searchNotes: 'true'
        }
        payload = default_conditions.merge(conditions)
        query_objects(payload, object_id)
      end

      def query_objects(payload, object_id)
        method, path = OBJECTS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload.merge({ objectID: object_id }))
      end

    end
  end
end
