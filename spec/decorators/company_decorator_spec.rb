require 'rails_helper'

RSpec.describe CompanyDecorator do
  let(:company) { create(:company_with_address).decorate }

  describe '#full_address' do
    context 'with only a primary street address' do
      before :each do
        company.street_address_2 = nil
      end

      it 'returns the first part of the street address' do
        expect(company.full_address).to match(/#{company.street_address}/)
      end
    end

    context 'with both parts of the address' do
      before :each do
        company.street_address_2 ||= Faker::Address.secondary_address
      end

      it 'returns both parts of the address' do
        expect(company.full_address)
          .to match(/#{company.street_address}, #{company.street_address_2}/)
      end
    end
  end

  describe '#city_state_zip' do
    context 'when an address is present' do
      it 'returns the formatted address' do
        expect(company.city_state_zip)
          .to match(/#{company.city}, #{company.state}, [0-9]{5}/)
      end
    end

    context 'when there is a piece missing' do
      before :each do
        company.postal_code = nil
      end

      it 'returns nil' do
        expect(company.city_state_zip).to be_nil
      end
    end
  end

  describe '#phone' do
    context 'when there is a main phone' do
      before :each do
        company.main_phone ||= Faker::PhoneNumber.phone_number
      end

      it 'returns the main_phone' do
        expect(company.phone).to eq company.main_phone
      end
    end

    context 'when there is no main phone, but a second_phone' do
      before :each do
        company.main_phone = nil
        company.second_phone ||= Faker::PhoneNumber.phone_number
      end

      it 'returns the main_phone' do
        expect(company.phone).to eq company.second_phone
      end
    end

    context 'when there is no phone' do
      before :each do
        company.main_phone = nil
        company.second_phone = nil
      end

      it 'returns the main_phone' do
        expect(company.phone).to be_nil
      end
    end
  end
end
