module OntraportApi
  module APIs
    module Sequences
      SEQUENCES_OBJECT_ID = 5
      SEQUENCES_API_METHODS_AND_PATHS = {
        'get_sequences'     => [:get,     '/objects']
      }

      def get_sequences
        query_sequences
      end

      def query_sequences(payload = {})
        method, path = SEQUENCES_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload.merge({ objectID: SEQUENCES_OBJECT_ID }))
      end
    end
  end
end
