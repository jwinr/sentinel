# spec/sentinel/languages/go_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/go_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::GoAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans Go files' do
      allow(Dir).to receive(:glob).with('**/*.go').and_return(['file1.go', 'file2.go'])
      expect(adapter.scan_files).to eq(['file1.go', 'file2.go'])
    end
  end
end