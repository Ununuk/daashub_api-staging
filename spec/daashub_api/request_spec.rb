require 'spec_helper'

describe DaashubAPI::Request do
  let(:endpoint) { '/v1/account/info' }
  let(:access_token) { 'sdfvk2387sgjh32' }
  let(:options) { {} }

  def perform_get
    DaashubAPI::Request.perform_get(endpoint, access_token, options)
  end

  describe '.perform_get' do
    context 'when token is valid' do
      it 'returns a Hash' do
        VCR.use_cassette 'account_info' do
          response = perform_get
          expect(response).to be_kind_of Hash
        end
      end
    end

    context 'when token is invalid' do
      it 'raises DaashubAPI::UnauthorizedError' do
        VCR.use_cassette 'account_info_invalid_token' do
          expect { perform_get }.to raise_error DaashubAPI::UnauthorizedError
        end
      end
    end

    context 'when uses invalid endpoint' do
      let(:endpoint) { '/v1/invalid/endpoint' }

      it 'raises DaashubAPI::PageNotFound' do
        VCR.use_cassette 'page_not_found' do
          expect { perform_get }.to raise_error DaashubAPI::PageNotFound
        end
      end
    end
  end
end
