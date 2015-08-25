class AddMainPhoneToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :main_phone, :string
    add_column :companies, :second_phone, :string
    add_column :companies, :fax, :string
  end
end
