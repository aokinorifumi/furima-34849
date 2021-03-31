class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  VALID_ZENKANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/

  with_options presence: true do
    validates :nickname
    validates :name_family_zen, format: { with: VALID_ZENKAKU_REGEX }
    validates :name_first_zen, format: { with: VALID_ZENKAKU_REGEX }
    validates :name_family_kana, format: { with: VALID_ZENKANA_REGEX }
    validates :name_first_kana, format: { with: VALID_ZENKANA_REGEX }
    validates :birth
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  end
end
