require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { build(:job) }

  it 'is valid with valid attributes' do
    expect(job).to be_valid
  end

  it 'is invalid without valid attributes' do
    job.company_name = nil
    expect(job).to_not be_valid
  end
end
