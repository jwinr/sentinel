# spec/sentinel/languages/php_adapter_spec.rb
require 'spec_helper'
require 'sentinel/languages/php_adapter'
require 'sentinel/core/feedback_system'
require_relative '../../support/shared_examples/adapter_shared_examples'

RSpec.describe Sentinel::Languages::PhpAdapter do
  let(:feedback_system) { Sentinel::Core::FeedbackSystem.new }
  let(:adapter) { described_class.new(feedback_system) }

  it_behaves_like "a language adapter"

  describe '#scan_files' do
    it 'scans PHP files' do
      allow(Dir).to receive(:glob).with('**/*.php').and_return(['file1.php', 'file2.php'])
      expect(adapter.scan_files).to eq(['file1.php', 'file2.php'])
    end
  end
end