class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 英数字混合6文字以上の正規表現
  VALID_PASSWORD_REGIX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/
  validates :password, format: {with: VALID_PASSWORD_REGIX} 

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :last_name
      validates :first_name
    end
    
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
