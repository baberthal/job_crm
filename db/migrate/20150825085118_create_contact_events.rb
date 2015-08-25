class CreateContactEvents < ActiveRecord::Migration
  def change
    create_table :contact_events do |t|
      t.datetime :contact_time, null: false
      t.belongs_to :job, index: true
      t.references :contactable, polymorphic: true, index: true
      t.string :event_type, index: true
      t.text :notes
      t.timestamps null: false
    end
  end
end
