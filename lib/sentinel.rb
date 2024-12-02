# lib/sentinel.rb
require_relative 'sentinel/core/feedback_system'
require_relative 'sentinel/core/compliance_checker'
require_relative 'sentinel/core/security_assessment'
require_relative 'sentinel/core/performance_monitor'
require_relative 'sentinel/core/language_detector'
require_relative 'sentinel/languages/ruby_adapter'
require_relative 'sentinel/languages/python_adapter'
require_relative 'sentinel/languages/php_adapter'
require_relative 'sentinel/languages/nodejs_adapter'
require_relative 'sentinel/languages/java_adapter'
require_relative 'sentinel/languages/go_adapter'
require_relative 'sentinel/languages/dotnet_adapter'

module Sentinel
  class Main
    def initialize
      @feedback_system = Core::FeedbackSystem.new
      language = Core::LanguageDetector.detect
      raise 'Unsupported language or no language detected' unless language

      @adapter = case language
                 when :ruby
                   Languages::RubyAdapter.new(@feedback_system)
                 when :python
                   Languages::PythonAdapter.new(@feedback_system)
                 when :php
                   Languages::PhpAdapter.new(@feedback_system)
                 when :nodejs
                   Languages::NodejsAdapter.new(@feedback_system)
                 when :java
                   Languages::JavaAdapter.new(@feedback_system)
                 when :go
                   Languages::GoAdapter.new(@feedback_system)
                 when :dotnet
                   Languages::DotnetAdapter.new(@feedback_system)
                 end
    end

    def run
      Core::ComplianceChecker.new(@adapter).run
      Core::SecurityAssessment.new(@adapter).run
      Core::PerformanceMonitor.new(@adapter).run

      puts @feedback_system.aggregate_feedback
    end
  end
end