module OntraportApi
  module APIs
    module Forms
      FORMS_API_METHODS_AND_PATHS = {
        'get_form'     => [:get,     '/form']
      }

      def get_form(id)
        query_forms({id: id})
      end

      def query_forms(payload)
        method, path = FORMS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload))
      end
    end
  end
end
