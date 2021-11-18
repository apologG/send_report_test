require 'rspec'
require 'report'

describe Report do
  let(:report) {described_class.new([
    { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'modified', created_at: '2019-06-08 23:40:02'},
    { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'confirmed', created_at: '2019-06-08 23:06:45'}
  ])}

  describe '.new' do 
    before :all do 
      @keys = %i(code guest entity type created_at)
    end
    
    it 'should be array' do 
      expect(report.body).kind_of? Array
    end
   
    it 'should valid data' do 
      report.body.each do |message|
        expect(message).kind_of? Hash
        expect(message.keys).to eq @keys
        expect(message.keys.size).to eq @keys.size
      end
    end
  end

  describe '#prepare_report_body' do 
    it 'should be a string' do 
      expect(report.prepare_report_body).kind_of? String
    end

    it 'should make text message for report' do 
      expect(report.prepare_report_body).to eq "A-001. Guest: guest@email.com. Modified reservation at '2019-06-08 23:40:02'\nA-001. Guest: guest@email.com. Confirmed reservation at '2019-06-08 23:06:45'"
    end
  end

  describe '#sort_by_date_asc!' do 
    before :each do 
      @data = [
        { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'confirmed', created_at: '2019-06-08 23:06:45'},
        { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'modified', created_at: '2019-06-08 23:40:02'}
      ]
    end
    
    it 'should sort by date' do 
      expect(report.sort_by_date_asc!).to eq @data
    end
  end
end
