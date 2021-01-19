FactoryBot.define do
  factory :item do
      name { 'test' }
       { 'test@example' }
      password { '00000a' }
      password_confirmation { password }
      family_name { '山田' }
      first_name { '太朗' }
      family_name_kana { 'ヤマダ' }
      first_name_kana { 'タロウ' }
      birthday { '2020-01-01' }
  end
end
