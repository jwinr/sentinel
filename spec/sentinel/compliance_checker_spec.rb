require 'spec_helper'
require 'sentinel/compliance_checker'
require 'sentinel/api_client'

RSpec.describe Sentinel::ComplianceChecker do
  let(:api_client) { instance_double(Sentinel::ApiClient) }
  let(:checker) { described_class.new(api_client) }

  it 'responds to check_idempotency' do
    expect(checker).to respond_to(:check_idempotency)
  end

  it 'responds to check_api_key_security' do
    expect(checker).to respond_to(:check_api_key_security)
  end

  it 'responds to check_error_handling' do
    expect(checker).to respond_to(:check_error_handling)
  end
end