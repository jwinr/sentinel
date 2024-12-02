# lib/sentinel/languages/ruby_adapter.rb
require_relative 'base_adapter'

module Sentinel
  module Languages
    class RubyAdapter < BaseAdapter
      def scan_files
        Dir.glob('**/*.rb')
      end

      def check_idempotency(api_client, feedback_system)
        api_logs = api_client.fetch_api_call_logs

        api_logs.each do |log|
          if log[:method] == 'POST' && !log[:idempotency_key]
            feedback_system.add_feedback(
              'RubyAdapter',
              'Idempotency Key Missing',
              "Add an idempotency key to the POST request for #{log[:endpoint]}",
              'High'
            )
          end
        end
      end

      def check_api_key_security(feedback_system)
        scan_files.each do |file|
          File.foreach(file).with_index do |line, line_number|
            if line =~ /Stripe\.api_key\s*=\s*['"]\w{32,}['"]/
              feedback_system.add_feedback(
                'RubyAdapter',
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

      def check_error_handling(feedback_system)
        # TODO: add error-handling validation for Ruby
      end
    end
  end
end