require 'spec_helper'
require 'sentinel/api_client'

RSpec.describe Sentinel::ApiClient do
  let(:api_key) { 'sk_test_' + ('a'..'z').to_a.sample(24).join }
  let(:client) { described_class.new(api_key) }

  describe '#validate_api_key' do
    it 'returns true for a valid API key' do
      allow(Stripe::Balance).to receive(:retrieve).and_return(double)
      expect(client.validate_api_key).to eq(true)
    end

    it 'returns false for an invalid API key' do
      allow(Stripe::Balance).to receive(:retrieve).and_raise(Stripe::AuthenticationError.new('Invalid API key'))
      expect(client.validate_api_key).to eq(false)
    end
  end

  describe '#fetch_api_call_logs' do
    it 'returns simulated API logs' do
      logs = client.fetch_api_call_logs
      expect(logs).to be_an(Array)
      expect(logs.first).to include(:method, :endpoint, :idempotency_key)
    end
  end

  describe '#webhook_signing_secret' do
    it 'returns the webhook signing secret from environment variables' do
      allow(ENV).to receive(:[]).with('STRIPE_WEBHOOK_SECRET').and_return('whsec_test_secret')
      expect(client.webhook_signing_secret).to eq('whsec_test_secret')
    end

    it 'returns the default signing secret if ENV variable is not set' do
      allow(ENV).to receive(:[]).with('STRIPE_WEBHOOK_SECRET').and_return(nil)
      expect(client.webhook_signing_secret).to eq('whsec_test_signing_secret')
    end
  end
end