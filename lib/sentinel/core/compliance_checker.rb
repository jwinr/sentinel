# lib/sentinel/core/compliance_checker.rb
module Sentinel
  module Core
    class ComplianceChecker
      def initialize(adapter)
        @adapter = adapter
      end

      def run
        @adapter.run_compliance_checks
      end
    end
  end
end