require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  before :each do
    10.times { create(:company) }
  end

  describe 'get #index' do
    before :each do
      get :index
    end

    it 'responds with HTTP status code 200' do
      expect(response.status).to eq 200
    end

    it 'assigns all the companies to @companies' do
      expect(assigns(:companies).length).to eq 10
    end
  end

  describe '#show' do
    before :each do
      get :show, id: Company.last.id
    end

    it 'assigns @company to the specified company' do
      expect(assigns(:company)).to eq Company.last
    end
  end

  describe '#new' do
    before :each do
      get :new
    end

    it 'assigns @company to a new instance of company, but does not save it' do
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:company) }

      before :each do
        post :create, company: valid_attributes
      end

      it 'redirects to the new company' do
        expect(response).to redirect_to Company.last
      end

      it 'assigns @company' do
        expect(assigns(:company)).to eq Company.last
      end
    end

    context 'without valid attributes' do
      it "doesn't save and redirects to #new" do
        post :create, company: attributes_for(:company_with_info, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    let(:company) { create(:company_with_info) }
    context 'with valid attributes' do
      before :each do
        put :update, id: company, company: attributes_for(:company)
      end

      it 'properly locates the requested @company' do
        expect(assigns(:company)).to eq company
      end

      it "changes the company's attributes" do
        put :update, id: company, company: { name: 'Blah Corp.' }
        company.reload
        expect(company.name).to eq 'Blah Corp.'
      end

      it 'redirects to the updated company' do
        expect(response).to redirect_to company
      end
    end

    context 'without valid attributes' do
      before :each do
        put :update, id: company, company: attributes_for(:company, name: nil)
      end

      it 'locates the correct company' do
        expect(assigns(:company)).to eq company
      end

      it 'does not change company attributes' do
        company.reload
        expect(company.name).to_not be_nil
      end

      it 're-renders the edit method' do
        expect(response).to render_template :edit
      end
    end
  end

  describe '#destroy' do
    let(:company) { create(:company) }

    it 'redirects to Company#index' do
      delete :destroy, id: company
      expect(response).to redirect_to companies_url
    end
  end
end
