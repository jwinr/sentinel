# spec/sentinel/core/compliance_checker_spec.rb
require 'spec_helper'
require 'sentinel/core/compliance_checker'
require 'sentinel/languages/base_adapter'

RSpec.describe Sentinel::Core::ComplianceChecker do
  let(:adapter) { instance_double(Sentinel::Languages::BaseAdapter) }
  let(:checker) { described_class.new(adapter) }

  describe '#run' do
    it 'delegates compliance checks to the adapter' do
      expect(adapter).to receive(:run_compliance_checks)
      checker.run
    end
  end
end