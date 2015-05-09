require 'test_helper'
require 'ontraport_api/client'

describe OntraportApi::Client do

  describe 'Error handling' do
    it 'when app_id or api_key blank' do
      proc {
        OntraportApi::Client.new(nil, nil)
      }.must_raise OntraportApi::Client::InvalidAppIdOrApiKey
    end
  end

end