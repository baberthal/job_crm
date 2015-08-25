class Job < ActiveRecord::Base
  belongs_to :company
  validates :company, presence: true
  alias_attribute :title, :position_name
end
