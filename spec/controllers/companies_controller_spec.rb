require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'get #index' do
    before :each do
      get :index
      10.times { create(:company) }
    end

    it 'responds with HTTP status code 200' do
      expect(response.status).to eq 200
    end

    it 'assigns all the companies to @companies' do
      expect(assigns(:companies).length).to eq 10
    end
  end
end
