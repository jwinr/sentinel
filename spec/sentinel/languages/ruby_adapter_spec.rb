# spec/sentinel/languages/ruby_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/ruby_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::RubyAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans Ruby files' do
      allow(Dir).to receive(:glob).with('**/*.rb').and_return(['file1.rb', 'file2.rb'])
      expect(adapter.scan_files).to eq(['file1.rb', 'file2.rb'])
    end
  end
end