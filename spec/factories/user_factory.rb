FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@email.com" }
    display_name "Billy Bob Thornton"
    password "password123"
    password_confirmation "password123"
  end
end
