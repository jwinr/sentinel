require 'spec_helper'
require 'sentinel'

RSpec.describe Sentinel::Main do
  let(:api_key) { 'test_api_key' }
  let(:sentinel) { described_class.new(api_key) }

  it 'responds to run_audit' do
    expect(sentinel).to respond_to(:run_audit)
  end
end