# spec/sentinel/languages/nodejs_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/nodejs_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::NodejsAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans JavaScript and TypeScript files' do
      allow(Dir).to receive(:glob).with('**/*.js').and_return(['file1.js'])
      allow(Dir).to receive(:glob).with('**/*.ts').and_return(['file2.ts'])
      expect(adapter.scan_files).to eq(['file1.js', 'file2.ts'])
    end
  end
end