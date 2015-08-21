class AddPositionNametoJobs < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.string :position_name
    end
  end
end
