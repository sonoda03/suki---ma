# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用メールアドレス・パスワード
Admin.create!(
  email: 'admin@admin.com',
  password: 'password1'
)

Genre.create!(
  [
    {name: '本'},
    {name: '音楽'},
    {name: '動画'},
    {name: '食べ物'},
    {name: 'その他'}
  ]
)

User.create!(
  [
    {
      email: 'sukima01@test.com',
      last_name: '平成',
      first_name: '平子',
      first_name_kana: 'ヘイセイ',
      last_name_kana: 'ヒラコ',
      nickname: 'ヒラhira',
      introduction: 'いろんな方法を試しています。ほかの方の役に立てるとうれしいです！！',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg"),
    },
    {
      email: 'sukima02@test.com',
      last_name: '大正',
      first_name: '大太郎',
      first_name_kana: 'タイショウ',
      last_name_kana: 'タイタロウ',
      nickname: 'bigタロウ',
      introduction: '本を中心に紹介しています。なので文字による休憩を好んでいます',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename: "sample-user2.jpg"),
    }
  ]
)

