class CompaniesController < ApplicationController
  before_action :find_company, only: [:edit, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id]).decorate
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = 'Model was successfully created.'
      redirect_to(@company)
    else
      render action: 'new'
    end
  end

  # PUT /companies/1
  def update
    if @company.update_attributes(company_params)
      flash[:notice] = 'Model was successfully updated.'
      redirect_to(@company)
    else
      render action: 'edit'
    end
  end

  # DELETE /companys/1
  # DELETE /companys/1.xml
  def destroy
    @company.destroy
    redirect_to(companies_url)
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
      :name,
      :street_address,
      :street_address_2,
      :city,
      :state,
      :postal_code,
      :main_phone,
      :second_phone,
      :fax)
  end
end
