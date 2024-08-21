class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々〆〤]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々〆〤]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana character' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana character' }
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must contain both letters and numbers' }
end
