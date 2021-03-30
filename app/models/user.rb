class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_ZENKANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :name_family_zen, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :name_first_zen, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :name_family_kana, presence: true, format: { with: VALID_ZENKANA_REGEX }
  validates :name_first_kana, presence: true, format: { with: VALID_ZENKANA_REGEX }
  validates :birth, presence: true

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
end
