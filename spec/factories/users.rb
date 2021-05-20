FactoryBot.define do
  factory :user do
    nickname              { "name" }
    email                 {Faker::Internet.free_email}
    password              {"111111ab"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_kana             {"タナカ"}
    first_kana            {"タロウ"} 
    birth_date            {"1992-02-06"}
   
  end
end