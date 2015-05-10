module OntraportApi
  module APIs
    module ContactSequences
      CONTACT_SEQUENCES_OBJECT_ID = 8
      CONTACT_SEQUENCES_API_METHODS_AND_PATHS = {
        'add_sequence_to_contact' => [:post,     '/objects']
      }

      def add_sequence_to_contact(sequence_id, contact_id)
        query_contact_sequences({ drip_id: sequence_id, contact_id: contact_id })
      end

      def query_contact_sequences(payload)
        method, path = CONTACT_SEQUENCES_API_METHODS_AND_PATHS[caller[0][/`.*'/][1..-2]]
        query(method, path, payload.merge({ objectID: CONTACT_SEQUENCES_OBJECT_ID }))
      end

    end
  end
end