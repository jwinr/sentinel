# spec/sentinel/languages/java_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/java_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::JavaAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans Java files' do
      allow(Dir).to receive(:glob).with('**/*.java').and_return(['file1.java', 'file2.java'])
      expect(adapter.scan_files).to eq(['file1.java', 'file2.java'])
    end
  end
end