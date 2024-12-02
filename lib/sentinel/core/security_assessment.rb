# lib/sentinel/core/security_assessment.rb
module Sentinel
  module Core
    class SecurityAssessment
      def initialize(adapter)
        @adapter = adapter
      end

      def run
        @adapter.run_security_checks
      end
    end
  end
end