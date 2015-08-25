class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :salutation
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :title
      t.belongs_to :company
      t.string :main_phone
      t.string :second_phone
      t.string :email
      t.timestamps null: false
    end

    add_index :contacts, [:first_name, :last_name], unique: true, name: 'by_full_name'
    add_index :contacts, :company_id
    add_index :contacts, :email
    add_index :contacts, :main_phone
  end
end
