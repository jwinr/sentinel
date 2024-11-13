require 'spec_helper'
require 'sentinel/feedback_system'

RSpec.describe Sentinel::FeedbackSystem do
  let(:feedback_system) { described_class.new }

  it 'responds to add_feedback' do
    expect(feedback_system).to respond_to(:add_feedback)
  end

  it 'responds to aggregate_feedback' do
    expect(feedback_system).to respond_to(:aggregate_feedback)
  end
end