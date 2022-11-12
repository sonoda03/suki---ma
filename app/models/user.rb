class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
