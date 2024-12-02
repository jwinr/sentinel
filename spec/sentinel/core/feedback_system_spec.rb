# spec/sentinel/core/feedback_system_spec.rb
require 'spec_helper'
require 'sentinel/core/feedback_system'

RSpec.describe Sentinel::Core::FeedbackSystem do
  let(:feedback_system) { described_class.new }

  describe '#add_feedback' do
    it 'adds feedback to the system' do
      feedback_system.add_feedback('ModuleName', 'Finding', 'Suggestion', 'High')
      expect(feedback_system.aggregate_feedback).to include(
        hash_including(
          module: 'ModuleName',
          finding: 'Finding',
          suggestion: 'Suggestion',
          severity: 'High'
        )
      )
    end
  end

  describe '#aggregate_feedback' do
    it 'returns all feedback added to the system' do
      feedback_system.add_feedback('ModuleName', 'Finding1', 'Suggestion1', 'High')
      feedback_system.add_feedback('ModuleName', 'Finding2', 'Suggestion2', 'Medium')

      expect(feedback_system.aggregate_feedback.size).to eq(2)
    end
  end
end