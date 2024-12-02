# spec/sentinel/core/performance_monitor_spec.rb
require 'spec_helper'
require 'sentinel/core/performance_monitor'
require 'sentinel/languages/base_adapter'

RSpec.describe Sentinel::Core::PerformanceMonitor do
  let(:adapter) { instance_double(Sentinel::Languages::BaseAdapter) }
  let(:monitor) { described_class.new(adapter) }

  describe '#run' do
    it 'delegates performance checks to the adapter' do
      expect(adapter).to receive(:run_performance_checks)
      monitor.run
    end
  end
end