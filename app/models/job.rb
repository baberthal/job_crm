class Job < ActiveRecord::Base
  belongs_to :company
  validates :company, presence: true
  alias_attribute :title, :position_name
  has_many :contact_events, as: :contactable
end
