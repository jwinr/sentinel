# lib/sentinel/compliance_checker.rb
module Sentinel
  class ComplianceChecker
    def initialize(api_client, feedback_system)
      @api_client = api_client
      @feedback_system = feedback_system
    end

    def check_idempotency
      api_logs = @api_client.fetch_api_call_logs

      api_logs.each do |log|
        if log[:method] == 'POST' && !log[:idempotency_key]
          @feedback_system.add_feedback(
            'ComplianceChecker',
            'Idempotency Key Missing',
            "Add an idempotency key to the POST request for #{log[:endpoint]}",
            'High'
          )
        end
      end
    end

    def check_api_key_security
      # Scan all Ruby files for hardcoded API keys
      files = Dir.glob('**/*.rb')

      files.each do |file|
        File.foreach(file).with_index do |line, line_number|
          # Pattern to match a hardcoded Stripe API key
          if line =~ /Stripe\.api_key\s*=\s*['"]\w{32,}['"]/
            @feedback_system.add_feedback(
              'ComplianceChecker',
              'Hardcoded API Key',
              "Hardcoded API key found in #{file} at line #{line_number + 1}. "\
              "Consider using environment variables or a secure key management service, "\
              "such as AWS Secrets Manager, Google Secret Manager, or HashiCorp Vault, "\
              "to manage sensitive keys securely.",
              'Critical'
            )
          end
        end
      end
    end

    def check_error_handling
      # Placeholder for error-handling validation
    end
  end
end