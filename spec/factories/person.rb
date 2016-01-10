require 'factory_girl'

FactoryGirl.define do
  factory :person do
    phone_number { '+1' + Faker::PhoneNumber.phone_number.tr('.', '') }
    zip_code { Faker::Address.zip_code }
    alert { false }
  end
end
