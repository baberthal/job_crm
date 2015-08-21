FactoryGirl.define do
  factory :job do
    company_name { Faker::Company.name }
    position_name { Faker::Name.title }
    application_sent { Faker::Date.backward(7) }
    last_touch { application_sent }
  end
end
