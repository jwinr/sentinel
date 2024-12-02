# spec/sentinel/languages/python_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/python_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::PythonAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans Python files' do
      allow(Dir).to receive(:glob).with('**/*.py').and_return(['file1.py', 'file2.py'])
      expect(adapter.scan_files).to eq(['file1.py', 'file2.py'])
    end
  end
end