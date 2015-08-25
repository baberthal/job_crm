class ContactEvent < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  belongs_to :job
end
