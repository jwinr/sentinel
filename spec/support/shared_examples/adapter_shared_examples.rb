RSpec.shared_examples "a language adapter" do
  describe '#scan_files' do
    it 'responds to scan_files' do
      expect(adapter).to respond_to(:scan_files)
    end

    it 'returns an array of files' do
      expect(adapter.scan_files).to be_an(Array)
    end
  end

  describe '#run_compliance_checks' do
    it 'responds to run_compliance_checks' do
      expect(adapter).to respond_to(:run_compliance_checks)
    end
  end

  describe '#run_security_checks' do
    it 'responds to run_security_checks' do
      expect(adapter).to respond_to(:run_security_checks)
    end
  end

  describe '#run_performance_checks' do
    it 'responds to run_performance_checks' do
      expect(adapter).to respond_to(:run_performance_checks)
    end
  end
end