# lib/sentinel/core/language_detector.rb
module Sentinel
  module Core
    class LanguageDetector
      LANGUAGE_MAP = {
        ruby: '**/*.rb',
        python: '**/*.py',
        php: '**/*.php',
        nodejs: ['**/*.js', '**/*.ts'],
        java: '**/*.java',
        go: '**/*.go',
        dotnet: '**/*.cs'
      }.freeze

      def self.detect
        LANGUAGE_MAP.each do |language, patterns|
          patterns = [patterns] unless patterns.is_a?(Array)
          patterns.each do |pattern|
            return language if Dir.glob(pattern).any?
          end
        end
        nil # Return nil if no matching language is found
      end
    end
  end
end