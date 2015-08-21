class AddFieldsToJobs < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.datetime :last_touch
      t.datetime :application_sent
    end
    add_index :jobs, :company_name
  end
end
