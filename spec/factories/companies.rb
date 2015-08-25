FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }

    trait :with_address do
      street_address { Faker::Address.street_address }
      street_address_2 { Faker::Address.secondary_address }
      city { Faker::Address.city }
      state { Faker::Address.state_abbr }
      postal_code { Faker::Address.postcode }
    end

    factory :company_with_address, traits: [:with_address]
  end
end
