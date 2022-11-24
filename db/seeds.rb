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
  password: 'password'
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
    },
    {
      email: 'sukima03@test.com',
      last_name: '令和',
      first_name: '令介',
      first_name_kana: 'レイワ',
      last_name_kana: 'レイスケ',
      nickname: '令wa04',
      introduction: 'よろしく！！ノリノリな曲を聴いてテンションを上げてるよ！！たまにゆったりとした曲でリフレッシュ！！',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg"),
    },
    {
      email: 'sukima04@test.com',
      last_name: '昭和',
      first_name: '昭次郎',
      first_name_kana: 'ショウワ',
      last_name_kana: 'ショウジロウ',
      nickname: 'showshow',
      introduction: 'ささっと食べれるものを中心に紹介中！休憩が長引かないように時間をとりすぎない一口食べ物が大好きです',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename: "sample-user4.jpg"),
    },
    {
      email: 'sukima05@test.com',
      last_name: '明治',
      first_name: '明代',
      first_name_kana: 'メイジ',
      last_name_kana: 'アキヨ',
      nickname: '！アッキーヨ！',
      introduction: 'おすすめストレッチを紹介！５分～１０分の短いストレッチで身体も心もスッキリ！！',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename: "sample-user5.jpg"),
    },
    {
      email: 'sukima06@test.com',
      last_name: '大化',
      first_name: 'たい夫',
      first_name_kana: 'タイカ',
      last_name_kana: 'タイオ',
      nickname: 'first元号',
      introduction: '最近登録したばかりです。いつも楽しくほかの方の投稿を参考にしています。自分に合った休憩方法を模索中です',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename: "sample-user6.jpg"),
    }
  ]
)

Genre.create!(
  [
    {name: '本'},
    {name: '音楽'},
    {name: '動画'},
    {name: '食べ物'},
    {name: '運動'},
    {name: 'その他'}
  ]
)

Tag.create!(
  [
    {name: '10分'},
    {name: 'クラシック'},
    {name: 'テンションアップ'},
    {name: '5分'},
    {name: '甘い'},
    {name: 'スイーツ'}
  ]
)

Post.create!(
  [
    {
      user_id: 1,
      genre_id: 2,
      title: 'ジャジャジャジャーン',
      introduction: 'ベートーベン『運命』交響曲第五番第一楽章です。疲れててもこれを聞くとテンションがあがりますよ！！',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename: "sample-post1.jpg"),
      url: 'https://www.youtube.com/watch?v=PTr1v1ksWkQ'
    },
    {
      user_id: 2,
      genre_id: 4,
      title: 'ひとくちシュークリーム',
      introduction: 'たった一口終わってしまうシュークリームケーキ！！気分転換にピッタリ',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename: "sample-post2.jpg"),
      url: 'https://www.youtube.com/watch?v=PTr1v1ksWkQ'
    }
  ]
)

PostTag.create!(
  [
    {post_id: 1, tag_id: 1},
    {post_id: 1, tag_id: 2},
    {post_id: 1, tag_id: 3},
    {post_id: 2, tag_id: 4},
    {post_id: 2, tag_id: 5},
    {post_id: 2, tag_id: 6},
    {post_id: 2, tag_id: 3},
  ]
)

Favorite.create!(
  [
    {user_id: 1, post_id: 2}
  ]
)


