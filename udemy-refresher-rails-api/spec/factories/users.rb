FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "jdoe #{n}" }
    name { "John Doe" }
    url { "http://example.com" }
    avatar_url { "http://example.com/avatar" }
    provider { "github" }
  end
end
