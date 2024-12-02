# lib/sentinel/core/performance_monitor.rb
module Sentinel
  module Core
    class PerformanceMonitor
      def initialize(adapter)
        @adapter = adapter
      end

      def run
        @adapter.run_performance_checks
      end
    end
  end
end