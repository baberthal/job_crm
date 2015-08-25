class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state, limit: 2
      t.string :postal_code, limit: 12
      t.timestamps null: false
    end

    add_index :companies, :name, unique: true
    add_index :companies,
              [:street_address,
               :street_address_2,
               :city,
               :state,
               :postal_code],
              unique: true,
              name: 'by_address'
  end
end
