class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 英数字混合6文字以上の正規表現
  VALID_PASSWORD_REGIX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/

  validates :password,        presence: true, format: {with: VALID_PASSWORD_REGIX}
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name,      presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :last_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/} 
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday,        presence: true
end
