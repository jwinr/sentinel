# spec/sentinel/core/language_detector_spec.rb
require 'spec_helper'
require 'sentinel/core/language_detector'

RSpec.describe Sentinel::Core::LanguageDetector do
  describe '.detect' do
    it 'returns :ruby when Ruby files are present' do
      allow(Dir).to receive(:glob).with('**/*.rb').and_return(['file1.rb'])
      allow(Dir).to receive(:glob).with('**/*.py').and_return([])
      allow(Dir).to receive(:glob).with('**/*.php').and_return([])
      allow(Dir).to receive(:glob).with('**/*.js').and_return([])
      allow(Dir).to receive(:glob).with('**/*.ts').and_return([])
      allow(Dir).to receive(:glob).with('**/*.java').and_return([])
      allow(Dir).to receive(:glob).with('**/*.go').and_return([])
      allow(Dir).to receive(:glob).with('**/*.cs').and_return([])

      expect(described_class.detect).to eq(:ruby)
    end

    it 'returns :python when Python files are present' do
      allow(Dir).to receive(:glob).with('**/*.rb').and_return([])
      allow(Dir).to receive(:glob).with('**/*.py').and_return(['file1.py'])
      allow(Dir).to receive(:glob).with('**/*.php').and_return([])
      allow(Dir).to receive(:glob).with('**/*.js').and_return([])
      allow(Dir).to receive(:glob).with('**/*.ts').and_return([])
      allow(Dir).to receive(:glob).with('**/*.java').and_return([])
      allow(Dir).to receive(:glob).with('**/*.go').and_return([])
      allow(Dir).to receive(:glob).with('**/*.cs').and_return([])

      expect(described_class.detect).to eq(:python)
    end

    it 'returns nil when no supported language files are found' do
      allow(Dir).to receive(:glob).and_return([])

      expect(described_class.detect).to be_nil
    end
  end
end