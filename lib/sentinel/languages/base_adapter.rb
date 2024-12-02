# lib/sentinel/languages/base_adapter.rb
module Sentinel
  module Languages
    class BaseAdapter
      def initialize(feedback_system)
        @feedback_system = feedback_system
      end

      def scan_files
        raise NotImplementedError, "Subclasses must implement `scan_files`"
      end

      def run_compliance_checks
        raise NotImplementedError, "Subclasses must implement `run_compliance_checks`"
      end

      def run_security_checks
        raise NotImplementedError, "Subclasses must implement `run_security_checks`"
      end

      def run_performance_checks
        raise NotImplementedError, "Subclasses must implement `run_performance_checks`"
      end
    end
  end
end