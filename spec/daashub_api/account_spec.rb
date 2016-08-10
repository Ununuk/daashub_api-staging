require 'spec_helper'

describe DaashubAPI::Account do
  let(:account) { DaashubAPI::Account.new(args) }
  let(:args) { { 'records_left' => 50, 'renewal_date' => '2016-02-24T09:22:49.985Z' } }

  it 'exists' do
    expect(account).to be_kind_of DaashubAPI::Account
  end

  it 'responds to records_left' do
    expect(account).to respond_to :records_left
  end

  describe '#records_left' do
    it 'returns number' do
      expect(account.records_left).to eq(50)
    end
  end

  describe '#renewal_date' do
    it 'returns time' do
      expect(account.renewal_date).to be_kind_of Time
    end
  end
end
