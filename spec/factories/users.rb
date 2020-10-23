FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"000000"}
    password_confirmation {"000000"}
    family_name           {"ぜんかく"}
    first_name            {"ぜんかく"}
    family_name_kana      {"ゼンカク"}
    first_name_kana       {"ゼンカク"}
    birth_day             {"2020-01-01"} 
  end
end
