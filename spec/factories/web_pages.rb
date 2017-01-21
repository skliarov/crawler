FactoryGirl.define do
  factory :web_page do
    url { Faker::Internet.url }
  end
end
