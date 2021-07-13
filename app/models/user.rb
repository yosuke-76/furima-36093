class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
    validates :last_name, presence: true, 
    validates :first_name, presence: true, 
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana, presence: true,
    validates :first_name_kana, presence:true,
  end
  validates :birthday, presence: true
end
