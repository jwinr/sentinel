# lib/sentinel/api_client.rb
require 'stripe'

module Sentinel
  class ApiClient
    def initialize(api_key)
      @api_key = api_key
      Stripe.api_key = @api_key
    end

    def fetch_api_call_logs
      # Placeholder: Simulate fetching API logs
      # In a real implementation, replace this with Stripe's API or logs from your server
      [
        { method: 'POST', endpoint: '/v1/charges', idempotency_key: nil },
        { method: 'POST', endpoint: '/v1/customers', idempotency_key: '12345' }
      ]
    end

    def validate_api_key
      begin
        Stripe::Balance.retrieve
        true
      rescue Stripe::AuthenticationError
        false
      end
    end

    def webhook_signing_secret
      # Placeholder: Retrieve the webhook signing secret
      # In a real-world scenario, this might pull from environment variables or a config file
      ENV['STRIPE_WEBHOOK_SECRET'] || 'whsec_test_signing_secret'
    end
  end
end