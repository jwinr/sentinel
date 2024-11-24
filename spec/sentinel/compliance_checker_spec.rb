require 'spec_helper'
require 'sentinel/compliance_checker'
require 'sentinel/api_client'
require 'sentinel/feedback_system'

RSpec.describe Sentinel::ComplianceChecker do
  let(:api_client) { Sentinel::ApiClient.new('test_api_key') }
  let(:feedback_system) { Sentinel::FeedbackSystem.new }
  let(:checker) { described_class.new(api_client, feedback_system) }

  describe '#check_idempotency' do
    it 'adds feedback for POST requests without an idempotency key' do
      checker.check_idempotency
      feedback = feedback_system.aggregate_feedback

      expect(feedback).to include(
        hash_including(
          finding: 'Idempotency Key Missing',
          suggestion: 'Add an idempotency key to the POST request for /v1/customers',
          severity: 'High'
        )
      )
    end
  end

  describe '#check_api_key_security' do
    it 'adds feedback for hardcoded API keys' do
      # We're creating a test file with a hypothetical hardcoded API key
      test_file = 'test_file.rb'
      File.open(test_file, 'w') do |f|
        f.write("Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'\n")
      end

      # Run the check
      checker.check_api_key_security

      # Validate feedback
      feedback = feedback_system.aggregate_feedback
      expect(feedback).to include(
        hash_including(
          finding: 'Hardcoded API Key',
          suggestion: "Hardcoded API key found in test_file.rb at line 1. "\
                      "Consider using environment variables or a secure key management service, "\
                      "such as AWS Secrets Manager, Google Secret Manager, or HashiCorp Vault, "\
                      "to manage sensitive keys securely.",
          severity: 'Critical'
        )
      )

      File.delete(test_file)
    end
  end
end