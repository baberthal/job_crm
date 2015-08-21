class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name, null: false
      t.timestamps null: false
    end
  end
end
