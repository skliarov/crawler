FactoryGirl.define do
  factory :content_record do
    kind { ContentRecord::CONTENT_KINDS.sample }
    content { (kind == 'link') ? Faker::Internet.url : Faker::Lorem.sentence }
  end
end
