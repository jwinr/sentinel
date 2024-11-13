# lib/sentinel/feedback_system.rb
module Sentinel
  class FeedbackSystem
    def initialize
      @feedback = []
    end

    def add_feedback(module_name, finding, suggestion, severity)
      # Placeholder for adding a feedback entry to the list
      @feedback << {
        module: module_name,
        finding: finding,
        suggestion: suggestion,
        severity: severity
      }
    end

    def aggregate_feedback
      # Placeholder for aggregating and prioritizing feedback entries
      @feedback
    end
  end
end