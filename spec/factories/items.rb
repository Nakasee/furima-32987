FactoryBot.define do
  factory :item do
    name { 'test' }
    price { '3000' }
    description { 'test' }
    category_id { '2' }
    judgment_id { '2' }
    cost_id { '2' }
    prefecture_id { '2' }
    day_id { '2' }
  end
end
