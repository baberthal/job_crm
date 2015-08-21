require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'get #index' do
    before :each do
      get :index
      4.times { create(:job) }
    end

    it 'returns status 200' do
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      expect(response).to render_template 'index'
    end

    it 'loads all of the jobs into @jobs' do
      expect(assigns(:jobs).length).to eq 4
    end
  end
end
