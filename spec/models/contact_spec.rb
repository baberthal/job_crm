require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe '#create' do
    shared_examples 'validations' do
      it 'is valid with valid attributes' do
        expect(contact).to be_valid
      end

      it 'is invalid without valid attributes' do
        contact.first_name = nil
        expect(contact).to_not be_valid
      end
    end

    context 'when only a first and last name are provided' do
      let(:contact) { build(:contact) }
      it_behaves_like 'validations'
    end

    context 'when all attributes are provided' do
      let(:contact) { build(:contact_with_all_info) }
      it_behaves_like 'validations'
    end

    context 'when only a company is provided' do
      let(:contact) { build(:contact_with_company) }
      it_behaves_like 'validations'
    end
  end
end
