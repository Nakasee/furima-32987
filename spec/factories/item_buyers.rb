FactoryBot.define do
  factory :item_buyer do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '鳥取市' }
    address { '1-1-1' }
    building_name  { 'testビル' }
    phone_number   { '09012345678' }
    association :item
    association :user
  end
end
