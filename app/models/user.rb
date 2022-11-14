class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image_square'
  end

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

  # 姓(last_name)と名(irst_name)を合わせて表示
  def full_name
    self.last_name + self.first_name
  end
end
