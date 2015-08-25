require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#bootstrap_class_for' do
    let(:expected) do
      {
        success: 'alert-success',
        error: 'alert-danger',
        alert: 'alert-warning',
        notice: 'alert-info',
        danger: 'alert-danger'
      }
    end

    it 'returns the proper class given the flash_type' do
      expected.each do |k, v|
        expect(helper.bootstrap_class_for(k)).to eq v
      end
    end
  end
end
