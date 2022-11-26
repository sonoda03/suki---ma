# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン用メールアドレス・パスワード
Admin.create!(
  email: 'admin@admin.comm',
  password: 'password'
)

# 登録ユーザの情報
User.create!(
  [
    {
      email: 'sukima01@test.comm',
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
      email: 'sukima02@test.comm',
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
      email: 'sukima03@test.comm',
      last_name: '令和',
      first_name: '令介',
      first_name_kana: 'レイワ',
      last_name_kana: 'レイスケ',
      nickname: '令wa04',
      introduction: 'よろしく！！動画を見たり、ノリノリな曲を聴いてテンションを上げてるよ！！！',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename: "sample-user3.jpg"),
    },
    {
      email: 'sukima04@test.comm',
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
      email: 'sukima05@test.comm',
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
      email: 'sukima06@test.comm',
      last_name: '大化',
      first_name: 'たい夫',
      first_name_kana: 'タイカ',
      last_name_kana: 'タイオ',
      nickname: 'first元号',
      introduction: '最近登録したばかりです。いつも楽しくほかの方の投稿を参考にしています。自分に合った休憩方法を模索中です。おすすめがあったら投稿したいと思います',
      password: 'password',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename: "sample-user6.jpg"),
    }
  ]
)

# ジャンル
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

# 投稿
Post.create!(
  [
    {
      user_id: 1,
      genre_id: 5,
      title: '！疲れがとれる6分間ストレッチ！',
      introduction: 'とくに自宅で仕事や勉強をしている方におすすめ！床に座って行うストレッチなのである程度空間が必要です。',
      url: 'https://stretch_douga_tukaresayonara.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename: "sample-post1.jpg")
    },
    {
      user_id: 1,
      genre_id: 6,
      title: '瞑想して心身の共にリフレッシュ',
      introduction: '瞑想にはたっぷり時間を取った方がいいと思われる方もいるかもしれません。ですが瞑想は5分・10分でも実はOKなんです！
                      いつも下記動画を参考にしています！！ストレスの軽減や学習力/記憶能力/集中力の向上など効果はたっぷり！！',
      url: '',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename: "sample-post2.jpg")
    },
    {
      user_id: 2,
      genre_id: 1,
      title: '【にやにやなっちゃう】癒されるどうぶつの赤ちゃん',
      introduction: 'つらい日々も癒しがあれば乗り越えられる…。
                    癒しといえば動物、その中でも動物の赤ちゃんは癒しのカタマリ！！
                    下記URLで紹介している本では、表紙から癒しが溢れています！！1ページ１ページ内容が短いので区切りがよく、ちょっとした休憩にピッタリ',
      url: 'https://animal_baby_books.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename: "sample-post3.jpg")
    } ,
    {
      user_id: 3,
      genre_id: 3,
      title: '【運命】ジャジャジャジャーン',
      introduction: '今どきの曲もいいけど思い切ってクラシックはどうでしょう？？
                      誰もが知っているベートーベン『運命』交響曲第五番第一楽章。
                      クラシックには「幸せホルモン」が出やすくなり、心が安定するばかりか、自尊心と自信をもって物事に取り組めるようになるそうです！！
                      今回紹介する曲は10分以内に終わりますし、上記の効果があるのでとってもおすすめです。',
      url: 'https://unmei_douga_classic.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename: "sample-post4.jpg")
    },
    {
      user_id: 3,
      genre_id: 2,
      title: 'ケルティック・ハープですっきりしよう',
      introduction: 'ヒーリング楽器の原点ともいえるケルティック・ハープを、アイルランドにて新規オリジナル・レコーディングしたCDです。
                    個人的には5曲目の「小さな妖精の丘、大きな妖精の丘」がおすすめ！！
                    ヒーリング楽器の原点ともいえるケルティック・ハープを聞いて頑張って疲れた心をリセットしませんか？？',
      url: 'https://celt_harp_iyasi.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename: "sample-post5.jpg")
    },
    {
      user_id: 4,
      genre_id: 4,
      title: 'ひとくちドーナツ',
      introduction: '懐かしい味で、気軽に食べれるミニサイズ!甘いものを食べて元気を出しましょう！
                      一口なので量も調整できます。
                      僕のおすすめは勉強をする前にあらかじめ休憩（5～10分）で食べていい数量を用意しておくのがポイントです！
                      おすすめ商品URLを下記に貼っときますね！',
      url: 'https://hitokuti_donut.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename: "sample-post6.jpg")
    },
    {
      user_id: 4,
      genre_id: 4,
      title: 'ひとくちミックスゼリー',
      introduction: '気軽に食べれるミニサイズ!甘いものを食べて元気を出しましょう！色とりどりのゼリー…気分によってどれを食べるか迷ってしまいます！
                      一口なので量も調整できます。
                      僕のおすすめは勉強をする前にあらかじめ休憩（5～10分）で食べていい数量を用意しておくのがポイントです！
                      おすすめ商品URLを下記に貼っときますね！',
      url: 'https://hitokuti_jelly_colorful.test.co.jp',
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename: "sample-post7.jpg")
    },
    {
      user_id: 5,
      genre_id: 5,
      title: '首がこったらこのツボ',
      introduction: '仕事や職場の様々な場面に応用できるツボ押し。日々頑張ったりしていると首がこったりしますよね。
                    ちょっとした休憩時に手にある「頸頂点（ケイチョウテン）」を押すといいですよ！
                    「頸頂点」は、両手の甲側にあり、中指と人差し指の間から約２㎝手首に向かって下がった少しへこんだところが目安。
                    親指でゆっくり５秒押さえ揉みほぐすのを交互に繰り返すといいです！
                    リフレッシュできるだけでなく、首のこりにもきくのでおすすめです！！',
      url: '' ,
      post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename: "sample-post8.jpg")
    }
  ]
)

# タグ
Tag.create!(
  [
    {name: 'ストレッチ'},
    {name: '自宅'},
    {name: '瞑想'},
    {name: 'リラックス'},
    {name: '10分'},
    {name: 'クラシック'},
    {name: 'テンションアップ'},
    {name: '落ち着く'},
    {name: 'ハープ'},
    {name: '短め'},
    {name: '5分'},
    {name: 'かわいい'},
    {name: '甘い'},
    {name: 'スイーツ'},
    {name: 'ドーナッツ'},
    {name: 'ゼリー'},
    {name: '一瞬'},
    {name: '首コリ'},
    {name: 'いつでも'},
    {name: '疲れ'},
    {name: 'ツボ'},
    {name: '外'}
  ]
)

# 投稿とタグの中間テーブル
PostTag.create!(
  [
    {post_id: 1, tag_id: 1},
    {post_id: 1, tag_id: 2},
    {post_id: 1, tag_id: 10},

    {post_id: 2, tag_id: 2},
    {post_id: 2, tag_id: 3},
    {post_id: 2, tag_id: 4},
    {post_id: 2, tag_id: 5},

    {post_id: 3, tag_id: 4},
    {post_id: 3, tag_id: 12},

    {post_id: 4, tag_id: 5},
    {post_id: 4, tag_id: 6},
    {post_id: 4, tag_id: 7},

    {post_id: 5, tag_id: 8},
    {post_id: 5, tag_id: 9},
    {post_id: 5, tag_id: 10},

    {post_id: 6, tag_id: 11},
    {post_id: 6, tag_id: 13},
    {post_id: 6, tag_id: 14},
    {post_id: 6, tag_id: 15},
    {post_id: 6, tag_id: 17},

    {post_id: 7, tag_id: 11},
    {post_id: 7, tag_id: 13},
    {post_id: 7, tag_id: 16},
    {post_id: 7, tag_id: 17},

    {post_id: 8, tag_id: 2},
    {post_id: 8, tag_id: 17},
    {post_id: 8, tag_id: 18},
    {post_id: 8, tag_id: 19},
    {post_id: 8, tag_id: 20},
    {post_id: 8, tag_id: 21},
    {post_id: 8, tag_id: 22},
  ]
)

# 投稿に対するコメント
PostComment.create!(
  [
    {
      user_id: 4,
      post_id: 1,
      comment: '紹介しているように自宅でやるのがいいのですね。
                とくに私は頑張っていると体に力が入るようで、疲れやすいです。
                そんな私にこのストレッチはとてもよくきくので気に入っています',
    },
    {
      user_id: 3,
      post_id: 1,
      comment: '短めなので小休憩のときに紹介していただいた動画を重宝しています。',
    },
    {
      user_id: 1,
      post_id: 7,
      comment: 'ゼリーはお腹が膨れるのでダイエットにもいいですよね。食べすぎには注意しないとですね',
    }
  ]
)

# 投稿に対するお気に入り（ブックマーク）
Favorite.create!(
  [
    {user_id: 1, post_id: 3},
    {user_id: 1, post_id: 4},
    {user_id: 1, post_id: 6},
    {user_id: 1, post_id: 8},

    {user_id: 2, post_id: 1},
    {user_id: 2, post_id: 7},
    {user_id: 2, post_id: 8},

    {user_id: 3, post_id: 1},
    {user_id: 3, post_id: 3},

    {user_id: 4, post_id: 1},
    {user_id: 4, post_id: 2},
    {user_id: 4, post_id: 3},
    {user_id: 4, post_id: 4},
    {user_id: 4, post_id: 5},

    {user_id: 5, post_id: 3},

    {user_id: 6, post_id: 7},
    {user_id: 6, post_id: 1},
    {user_id: 6, post_id: 3}
  ]
)

