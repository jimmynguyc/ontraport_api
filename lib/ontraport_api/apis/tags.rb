module OntraportApi
  module APIs
    module Tags
      TAGS_OBJECT_ID = 14
      TAGS_API_METHODS_AND_PATHS = {
        'get_tags'     => [:get,     '/objects'],
        'new_tag'     => [:post,    '/objects'],
      }

      def get_tags
        query_tags
      end

      def new_tag(tag_name)
        query_tags({ tag_name: tag_name })
      end

      def query_tags(payload = {})
        method, path = TAGS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload.merge({ objectID: TAGS_OBJECT_ID }))
      end
    end
  end
end
