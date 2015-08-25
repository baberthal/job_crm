class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  # GET /companys
  def index
    @companies = Company.all

    respond_to do |format|
      format.html
    end
  end

  # GET /companies/1
  def show
    respond_to do |format|
      format.html
    end
  end

  # GET /companies/new
  def new
    @company = Company.new

    respond_to do |format|
      format.html
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        flash[:notice] = 'Model was successfully created.'
        format.html { redirect_to(@company) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /companies/1
  def update
    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'Model was successfully updated.'
        format.html { redirect_to(@company) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /companys/1
  # DELETE /companys/1.xml
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companys_url) }
    end
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end
end
