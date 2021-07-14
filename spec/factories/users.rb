FactoryBot.define do
  factory :user do
    nick_name {'aaa'}
    email {Faker::Internet.unique.free_email}
    password {'aaaaaa1'}
    password_confirmation { password }
    last_name {'山田'}
    first_name {'太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'1997-01-01'}
  end
end