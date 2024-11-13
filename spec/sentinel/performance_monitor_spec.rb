require 'spec_helper'
require 'sentinel/performance_monitor'
require 'sentinel/api_client'

RSpec.describe Sentinel::PerformanceMonitor do
  let(:api_client) { instance_double(Sentinel::ApiClient) }
  let(:monitor) { described_class.new(api_client) }

  it 'responds to analyze_api_usage' do
    expect(monitor).to respond_to(:analyze_api_usage)
  end

  it 'responds to measure_latency' do
    expect(monitor).to respond_to(:measure_latency)
  end
end