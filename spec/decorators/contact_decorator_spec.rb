require 'rails_helper'

RSpec.describe ContactDecorator do
  let(:contact) { create(:contact_with_salutation).decorate }

  describe '#name' do
    it 'returns the full name' do
      expect(contact.name)
        .to match(/#{contact.first_name} #{contact.last_name}/)
    end
  end

  describe '#full_name' do
    it 'returns the full name with salutation' do
      expect(contact.full_name).to match(/(Mr|Mrs|Ms)*#{contact.name}/)
    end
  end

  describe '#list_group_info' do
    it 'returns span tags with the proper content' do
      expect(contact.list_group_info).to match(/<span class='text-left'>/)
    end
  end
end
