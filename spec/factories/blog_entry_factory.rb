FactoryGirl.define do
  factory :blog_entry do
    sequence(:title)  { |n| "entry #{n}" }
    body 'This is a blog post'
    ip  '1.2.3.4'
    association :user, factory: :user
  end
end
