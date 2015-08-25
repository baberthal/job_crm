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

    trait :with_all_phones do
      main_phone { Faker::PhoneNumber.phone_number }
      second_phone { Faker::PhoneNumber.phone_number }
    end

    factory :company_with_address, traits: [:with_address]
    factory :company_with_info, traits: [:with_address, :with_all_phones]
  end
end
