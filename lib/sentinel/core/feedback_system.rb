# lib/sentinel/core/feedback_system.rb
module Sentinel
  module Core
    class FeedbackSystem
      def initialize
        @feedback = []
      end

      def add_feedback(module_name, finding, suggestion, severity)
        @feedback << {
          module: module_name,
          finding: finding,
          suggestion: suggestion,
          severity: severity
        }
      end

      def aggregate_feedback
        @feedback
      end
    end
  end
end