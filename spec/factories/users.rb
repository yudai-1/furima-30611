FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000a"}
    password_confirmation {password}
    family_name           {"ぜんかく"}
    first_name            {"ぜんかく"}
    family_name_kana      {"ゼンカクカナ"}
    first_name_kana       {"ゼンカクカナ"}
    birth_day             {"2020-01-01"} 
  end
end
