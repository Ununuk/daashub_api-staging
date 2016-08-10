require 'spec_helper'

describe DaashubAPI::Company do
  let(:company) { DaashubAPI::Company.new(args) }
  let(:args) { { email: 'katie@example.com' } }

  it 'exists' do
    expect(company).to be_kind_of DaashubAPI::Company
  end

  it 'responds to email' do
    expect(company).to respond_to :email
  end

  describe '#email' do
    it 'returns an email' do
      expect(company.email).to eq('katie@example.com')
    end
  end

  describe '.from_array' do
    let(:response) { {} }

    before do
      @companies = DaashubAPI::Company.from_array(response)
    end

    it 'returns array' do
      expect(@companies).to be_kind_of Array
    end

    context 'that' do
      it 'responds to :errors' do
        expect(@companies).to respond_to :errors
      end

      it 'responds to :error?' do
        expect(@companies).to respond_to :error?
      end
    end

    context 'when response is valid' do
      let(:response) { { 'fields' => ['email'], 'item_count' => 2, 'items' => [{ 'email' => 'katie@example.com' }, { 'email' => 'robert@example.com' }] } }

      it 'returns objects' do
        expect(@companies.count).to eq(2)
      end

      it 'returns DaashubAPI::Company objects' do
        expect(@companies.first).to be_kind_of DaashubAPI::Company
      end

      it 'has fields info' do
        expect(@companies.daashub_fields).to eq ['email']
      end

      it 'has no errors' do
        expect(@companies.error?).to be_falsy
        expect(@companies.errors).to be_empty
      end
    end

    context 'when response has errors' do
      let(:response) { { 'errors' => ['Wrong where attribute. Should be `domain=={domain}` or `email=={email}`.'] } }

      it 'returns empty array' do
        expect(@companies).to be_empty
      end

      it 'has errors' do
        expect(@companies.error?).to be_truthy
        expect(@companies.errors).to_not be_empty
      end
    end
  end
end
