class RemoveCompanyNameFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :company_name
  end
end
