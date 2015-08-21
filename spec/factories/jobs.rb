FactoryGirl.define do
  factory :job do
    company_name { Faker::Company.name }
  end
end
