FactoryGirl.define do
  factory :job do
    company_name { Faker::Company.name }
    application_sent { Faker::Date.backward(7) }
    last_touch { application_sent }
  end
end
