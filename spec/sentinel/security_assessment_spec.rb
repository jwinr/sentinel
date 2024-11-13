require 'spec_helper'
require 'sentinel/security_assessment'
require 'sentinel/api_client'

RSpec.describe Sentinel::SecurityAssessment do
  let(:api_client) { instance_double(Sentinel::ApiClient) }
  let(:assessment) { described_class.new(api_client) }

  it 'responds to check_webhook_security' do
    expect(assessment).to respond_to(:check_webhook_security)
  end

  it 'responds to check_sensitive_data_exposure' do
    expect(assessment).to respond_to(:check_sensitive_data_exposure)
  end
end