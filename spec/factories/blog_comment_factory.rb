FactoryGirl.define do
  factory :blog_comment do
    body 'This is a blog post'
    association :user, factory: :user
    association :blog_entry, factory: :blog_entry
  end
end
