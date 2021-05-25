FactoryBot.define do
  factory :item do
    name                  { "name" }
    explanation           {"これはサンプルです"}
    category_id           {2}
    condition_id          {2}
    which_pay_id          {2}
    prefecture_id         {2}
    period_id             {2}
    price                 {100000}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
