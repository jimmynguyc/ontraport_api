require 'httparty'
require_relative 'apis/contacts'
require_relative 'apis/forms'
require_relative 'apis/messages'
require_relative 'apis/products'
require_relative 'apis/tasks'
require_relative 'apis/transactions'

module OntraportApi
  class Client
    include HTTParty
    base_uri 'https://api.ontraport.com/1'

    include APIs::Contacts
    include APIs::Products
    include APIs::Forms
    include APIs::Messages
    include APIs::Tasks
    include APIs::Transactions

    class InvalidAppIdOrApiKey < StandardError
      def to_s
        "APP ID and API Key must not be blank"
      end
    end

    class InvalidAPIMethodOrPath < StandardError
      def to_s
        "Invalid API Method or Path"
      end
    end

    def initialize(app_id, api_key)
      raise InvalidAppIdOrApiKey if [app_id, api_key].any? { |w| w !~ blank_regex }
      @app_id = app_id
      @api_key = api_key
    end

    private

    def query(method, path, payload = {})
      raise InvalidAPIMethodOrPath if [method, path].any? { |w| w !~ blank_regex }
      self.call(method, path, payload)
    end

    def blank_regex
      /[^[:space:]]/
    end

  end
end