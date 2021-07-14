class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  with_options presence: true do
    validates :nick_name
    validates :birthday
    with_options format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}\z/ } do
      validates :password, length: { minimum: 6 }
    end
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end