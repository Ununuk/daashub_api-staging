require 'spec_helper'

describe DaashubAPI::Client do
  let(:access_token) { 'sdfvk2387sgjh32' }
  let(:client) { DaashubAPI::Client.new(access_token) }

  describe '#access_token' do
    it 'returns an access token' do
      expect(client.access_token).to eq(access_token)
    end
  end

  describe '.account_info' do
    it 'returns an Account object' do
      VCR.use_cassette 'account_info' do
        expect(client.account_info).to be_kind_of DaashubAPI::Account
      end
    end
  end

  describe '.companies' do
    let(:companies_options) { { where: { domain: 'www.example.com' }, limit: 2 } }

    it 'returns an array' do
      VCR.use_cassette 'companies' do
        expect(client.companies(companies_options)).to be_kind_of Array
      end
    end
  end

  describe '.requests' do
    it 'returns an History object' do
      VCR.use_cassette 'requests' do
        expect(client.requests).to be_kind_of DaashubAPI::History
      end
    end
  end
end
