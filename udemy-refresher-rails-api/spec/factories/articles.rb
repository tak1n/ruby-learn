FactoryBot.define do
  factory :article do
    title { "Sample Title" }
    content { "Sample Content" }
    sequence :slug do |n|
      "sample-title-slug-#{n}"
    end
  end
end
