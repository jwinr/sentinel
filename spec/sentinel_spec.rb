require 'spec_helper'
require 'sentinel'

RSpec.describe Sentinel::Main do
  let(:feedback_system) { instance_double(Sentinel::Core::FeedbackSystem) }
  let(:adapter) { instance_double(Sentinel::Languages::RubyAdapter) }
  let(:main) { described_class.new }

  before do
    # Mock the feedback system
    allow(Sentinel::Core::FeedbackSystem).to receive(:new).and_return(feedback_system)

    # Stub the language detector to return Ruby
    allow(Sentinel::Core::LanguageDetector).to receive(:detect).and_return(:ruby)

    # Stub the Ruby adapter
    allow(Sentinel::Languages::RubyAdapter).to receive(:new).and_return(adapter)

    # Stub adapter methods
    allow(adapter).to receive(:run_compliance_checks)
    allow(adapter).to receive(:run_security_checks)
    allow(adapter).to receive(:run_performance_checks)

    # Stub feedback aggregation
    allow(feedback_system).to receive(:aggregate_feedback).and_return([
      { module: 'RubyAdapter', finding: 'Test Issue', suggestion: 'Fix it!', severity: 'High' }
    ])
  end

  describe '#run' do
    it 'detects the language and runs all checks' do
      expect(Sentinel::Core::LanguageDetector).to receive(:detect).and_return(:ruby)
      expect(Sentinel::Languages::RubyAdapter).to receive(:new).with(feedback_system)
      expect(adapter).to receive(:run_compliance_checks)
      expect(adapter).to receive(:run_security_checks)
      expect(adapter).to receive(:run_performance_checks)
      expect(feedback_system).to receive(:aggregate_feedback)

      main.run
    end

    it 'prints aggregated feedback' do
      expect { main.run }.to output(/Test Issue/).to_stdout
    end

    it 'raises an error for unsupported languages' do
      allow(Sentinel::Core::LanguageDetector).to receive(:detect).and_return(nil)

      expect { main.run }.to raise_error('Unsupported language or no language detected')
    end
  end
end