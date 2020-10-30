FactoryBot.define do
  factory :item do
    name               {"hoge"}
    price              {"9999"}
    category_id        {2}
    condition_id       {2}
    postage_id         {2}
    region_id          {2}
    shipping_date_id   {2}
    description        {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
  end
end
