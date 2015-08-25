class Contact < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: [:last_name, :company]
end
