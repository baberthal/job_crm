require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'get #index' do
    before :each do
      get :index
      10.times { create(:company)}
    end

    it 'should 200' do
      expect(response.status).to eq 200
    end
  end
end
