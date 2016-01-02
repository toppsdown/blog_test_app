FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@email.com" }
    sequence(:display_name) { |n| "Billy Bob Thornton #{n}" }
    password "password123"
    password_confirmation "password123"
  end
end
