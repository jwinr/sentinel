# spec/sentinel/languages/dotnet_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/dotnet_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::DotnetAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans C# files' do
      allow(Dir).to receive(:glob).with('**/*.cs').and_return(['file1.cs', 'file2.cs'])
      expect(adapter.scan_files).to eq(['file1.cs', 'file2.cs'])
    end
  end
end