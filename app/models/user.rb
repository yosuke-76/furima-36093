class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :last_name, presence: true, 
            format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :first_name, presence: true, 
            format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :last_name_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
  validates :first_name_kana, presence:true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
  validates :birthday, presence: true
end
