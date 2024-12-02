# spec/sentinel/core/security_assessment_spec.rb
require 'spec_helper'
require 'sentinel/core/security_assessment'
require 'sentinel/languages/base_adapter'

RSpec.describe Sentinel::Core::SecurityAssessment do
  let(:adapter) { instance_double(Sentinel::Languages::BaseAdapter) }
  let(:assessment) { described_class.new(adapter) }

  describe '#run' do
    it 'delegates security checks to the adapter' do
      expect(adapter).to receive(:run_security_checks)
      assessment.run
    end
  end
end