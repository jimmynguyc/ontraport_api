module OntraportApi
  module APIs
    module Messages
      MESSAGES_API_METHODS_AND_PATHS = {
        'get_message'     => [:get,     '/message']
      }

      def get_message(id)
        query_messages({id: id})
      end

      def query_messages(payload)
        method, path = MESSAGES_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload)
      end
    end
  end
end
