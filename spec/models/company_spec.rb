require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#create' do
    context 'when only a name is provided' do
      let(:company) { build(:company) }

      it 'is valid with only a name' do
        expect(company).to be_valid
      end

      it 'is invalid without a name' do
        company.name = nil
        expect(company).to_not be_valid
      end
    end

    context 'when more information is provided' do
      let(:company) { build(:company_with_address) }

      it 'is valid with all the attributes' do
        expect(company).to be_valid
      end
    end
  end
end
