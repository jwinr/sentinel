require 'spec_helper'
require 'sentinel/report_generator'

RSpec.describe Sentinel::ReportGenerator do
  let(:feedback) { [] }
  let(:report_generator) { described_class.new(feedback) }

  it 'responds to generate_json' do
    expect(report_generator).to respond_to(:generate_json)
  end

  it 'responds to generate_csv' do
    expect(report_generator).to respond_to(:generate_csv)
  end
end