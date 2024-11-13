require 'spec_helper'
require 'sentinel/api_client'

RSpec.describe Sentinel::ApiClient do
  let(:api_key) { 'test_api_key' }
  let(:client) { described_class.new(api_key) }

  it 'responds to fetch_api_call_logs' do
    expect(client).to respond_to(:fetch_api_call_logs)
  end

  it 'responds to fetch_webhook_endpoints' do
    expect(client).to respond_to(:fetch_webhook_endpoints)
  end

  it 'responds to fetch_customer_data' do
    expect(client).to respond_to(:fetch_customer_data)
  end
end