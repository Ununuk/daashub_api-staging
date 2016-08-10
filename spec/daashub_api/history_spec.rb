require 'spec_helper'

describe DaashubAPI::History do
  let(:history) { described_class.new(args) }
  let(:args) do
    {
      fields: %w(company website email),
      item_count: 1,
      items: [
        {
          query: 'where=domain==example.com',
          ip_address: '123.45.67.89',
          sent_at: '2016-08-09T10:59:56.287Z',
          item_count: 1,
          items: [{ company: 'Example Limited', website: 'www.example.com', email: 'robert@example.com' }]
        }
      ],
      total_count: 1
    }
  end

  it 'exists' do
    expect(history).to be_kind_of DaashubAPI::History
  end

  it 'responds to fields' do
    expect(history).to respond_to :fields
  end

  it 'responds to item_count' do
    expect(history).to respond_to :item_count
  end

  it 'responds to total_count' do
    expect(history).to respond_to :total_count
  end

  describe '#fields' do
    it 'returns an array od fields' do
      expect(history.fields).to eq(%w(company website email))
    end
  end

  describe '#item_count' do
    it { expect(history.item_count).to eq(1) }
  end

  describe '#total_count' do
    it { expect(history.total_count).to eq(1) }
  end

  describe '#items' do
    it 'returns an array od Query objects' do
      expect(history.items[0]).to be_a(DaashubAPI::Query)
    end
  end
end
