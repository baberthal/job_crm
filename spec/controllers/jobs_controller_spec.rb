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

  describe 'get #show' do
    before :each do
      4.times { create(:job) }
      get :show, id: Job.last.id
    end

    let(:job) { Job.last }

    it 'returns status 200' do
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      expect(response).to render_template 'show'
    end

    it 'loads the correct job into jobs' do
      expect(assigns(:job)).to eq job
    end
  end
end
