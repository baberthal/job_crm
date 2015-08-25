class Company < ActiveRecord::Base
  has_many :contacts
  validates :name, presence: true, uniqueness: true
end
