class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, length: { in: 3..8 }
  validates :introduction, length: { maximum: 160 }

  has_one_attached :profile_image


  def self.guest
    find_or_create_by!(email: 'guest0123@example.com') do |user|
      user.last_name = '閲覧'
      user.first_name = '太郎'
      user.last_name_kana = 'エツラン'
      user.first_name_kana = 'タロウ'
      user.nickname = 'ゲスト'
      user.introduction = '運動による休憩方法を積極的に投稿しております！！'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # 姓(last_name)と名(first_name)を合わせて表示
  def full_name
    self.last_name + self.first_name
  end
end
