require 'spec_helper'

describe DaashubAPI::Query do
  let(:query) { described_class.new(args) }
  let(:args) do
    {
      query: 'where=domain==example.com',
      ip_address: '123.45.67.89',
      sent_at: '2016-08-09T10:59:56.287Z',
      item_count: 1,
      items: [{ company: 'Example Limited', website: 'www.example.com', email: 'robert@example.com' }]
    }
  end

  it 'exists' do
    expect(query).to be_kind_of DaashubAPI::Query
  end

  it 'responds to query' do
    expect(query).to respond_to :query
  end

  it 'responds to ip_address' do
    expect(query).to respond_to :ip_address
  end

  it 'responds to item_count' do
    expect(query).to respond_to :item_count
  end

  describe '#query' do
    it { expect(query.query).to eq('where=domain==example.com') }
  end

  describe '#ip_address' do
    it { expect(query.ip_address).to eq('123.45.67.89') }
  end

  describe '#item_count' do
    it { expect(query.item_count).to eq(1) }
  end

  describe '#sent_at' do
    it { expect(query.sent_at).to be_a(Time) }
  end

  describe '#items' do
    it 'returns an array od Company objects' do
      expect(query.items[0]).to be_a(DaashubAPI::Company)
    end
  end
end
