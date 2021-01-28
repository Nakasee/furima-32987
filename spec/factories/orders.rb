FactoryBot.define do
  factory :order do
    post_code    {'123-4567'}
    prefecture_id  {'3'}
    city      {'鳥取市'}
    address     {'1-1-1'}
    building_name  {'testビル'}
    phone_number   {'09012345678'}
    association :user
    association :item
  end
end
