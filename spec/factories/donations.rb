FactoryBot.define do
  factory :donation do
    post_code     {"123-1234"}
    city          {"福岡市"}
    block_number  {"1-1"}
    building_name {"サウスタワー"}
    phone_number  {"09012345678"}
    prefecture_id {1}
    token         {"tok_abcdefghijk00000000000000000"}


  end

end
