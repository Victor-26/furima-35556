FactoryBot.define do
  factory :item do
    name                  { "name" }
    explanation           {"これはサンプルです"}
    category_id           {1}
    condition_id          {1}
    which_pay_id          {1}
    prefecture_id         {1}
    period_id             {1}
    price                 {100000}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
