module OntraportApi
  module APIs
    module Tasks
      TASKS_API_METHODS_AND_PATHS = {
        'cancel_task'     => [:post,     '/task/cancel']
        'complete_task'   => [:post,     '/task/complete']
      }

      def cancel_task(criteria = {})
        query_tasks(criteria)
      end

      def complete_task(criteria = {}, data = {})
        query_tasks({ criteria: criteria, data: data })
      end

      def query_tasks(payload)
        method, path = TASKS_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload))
      end
    end
  end
end
