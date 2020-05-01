# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
last_names =  ["佐藤", "鈴木", "高橋", "田中", "伊藤", "山本", "渡辺", "中村", "小林", "加藤", "吉田", "山田", "佐々木", "山口", "松本", "井上", "木村", "林", "斎藤", "清水", "山崎", "阿部", "森", "池田", "橋本", "山下", "石川", "中島", "前田", "藤田", "後藤", "小川", "岡田", "村上", "長谷川", "近藤", "石井", "斉藤", "坂本", "遠藤", "藤井", "青木", "福田", "三浦", "西村", "藤原", "太田", "松田", "原田", "岡本", "中野", "中川", "小野", "田村", "竹内", "金子", "中山", "和田", "石田", "工藤", "上田", "原", "森田", "酒井", "横山", "柴田", "宮崎", "宮本", "内田", "高木", "谷口", "安藤", "丸山", "今井", "大野", "高田", "菅原", "河野", "武田", "藤本", "上野", "杉山", "千葉", "村田", "増田", "小島", "小山", "大塚", "平野", "久保", "渡部", "松井", "菊地", "岩崎", "松尾", "佐野", "木下", "野口", "野村", "新井", "田口", "盛合"]
first_names =  ["翔太", "蓮", "翔", "陸", "颯太", "悠斗", "大翔", "翼", "樹", "奏太", "大和", "大輝", "悠", "隼人", "健太", "大輔", "駿", "陽斗", "優", "陽", "悠人", "誠", "拓海", "仁", "悠太", "悠真", "大地", "健", "遼", "大樹", "諒", "響", "太一", "一郎", "優斗", "亮", "海斗", "颯", "亮太", "匠", "陽太", "航", "瑛太", "直樹", "空", "光", "太郎", "輝", "一輝", "蒼", "葵", "優那", "優奈", "凛", "陽菜", "愛", "結衣", "美咲", "楓", "さくら", "遥", "美優", "莉子", "七海", "美月", "結菜", "真央", "花音", "陽子", "舞", "美羽", "優衣", "未来", "彩", "彩乃", "彩花", "優", "智子", "奈々", "千尋", "愛美", "優菜", "杏", "裕子", "芽衣", "綾乃", "琴音", "桜", "恵", "杏奈", "美桜", "優花", "玲奈", "結", "茜", "美穂", "明日香", "愛子", "美緒", "碧", "悠介", "年章", "一刀"]
kana_last_names =  ["サトウ", "スズキ", "タカハシ", "タナカ", "イトウ", "ヤマモト", "ワタナベ", "ナカムラ", "コバヤシ", "カトウ", "ヨシダ", "ヤマダ", "ササキ", "ヤマグチ", "マツモト", "イノウエ", "キムラ", "ハヤシ", "サイトウ", "シミズ", "ヤマザキ", "アベ", "モリ", "イケダ", "ハシモト", "ヤマシタ", "イシカワ", "ナカジマ", "マエダ", "フジタ", "ゴトウ", "オガワ", "オカダ", "ムラカミ", "ハセガワ", "コンドウ", "イシイ", "サイトウ", "サカモト", "エンドウ", "フジイ", "アオキ", "フクダ", "ミウラ", "ニシムラ", "フジワラ", "オオタ", "マツダ", "ハラダ", "オカモト", "ナカノ", "ナカガワ", "オノ", "タムラ", "タケウチ", "カネコ", "ナカヤマ", "ワダ", "イシダ", "クドウ", "ウエダ", "ハラ", "モリタ", "サカイ", "ヨコヤマ", "シバタ", "ミヤザキ", "ミヤモト", "ウチダ", "タカギ", "タニグチ", "アンドウ", "マルヤマ", "イマイ", "オオノ", "タカダ", "スガワラ", "コウノ", "タケダ", "フジモト", "ウエノ", "スギヤマ", "チバ", "ムラタ", "マスダ", "コジマ", "コヤマ", "オオツカ", "ヒラノ", "クボ", "ワタナベ", "マツイ", "キクチ", "イワサキ", "マツオ", "サノ", "キノシタ", "ノグチ", "ノムラ", "アライ", "タグチ", "モリアイ"]
kana_first_names =  ["ショウタ", "レン", "ショウ", "リク", "ソウタ", "ユウト", "ヒロト", "ツバサ", "イツキ", "ソウタ", "ヤマト", "ダイキ", "ユウ", "ハヤト", "ケンタ", "ダイスケ", "シュン", "ハルト", "ユウ", "ヨウ", "ユウト", "マコト", "タクミ", "ジン", "ユウタ", "ユウマ", "ダイチ", "タケル", "リョウ", "ダイキ", "リョウ", "ヒビキ", "タイチ", "イチロウ", "ユウト", "リョウ", "カイト", "カエデ", "リョウタ", "タクミ", "ヨウタ", "ワタル", "エイタ", "ナオキ", "ソラ", "ヒカリ", "タロウ", "アキラ", "カズキ", "アオイ", "アオイ", "ユウナ", "ユウナ", "リン", "ハルナ", "アイ", "ユイ", "ミサキ", "カエデ", "サクラ", "ハルカ", "ミユウ", "リコ", "ナナミ", "ミヅキ", "ユナ", "マオ", "カノン", "ヨウコ", "マイ", "ミウ", "ユイ", "ミク", "アヤ", "アヤノ", "アヤカ", "ユウ", "トモコ", "ナナ", "チヒロ", "マナミ", "ユウナ", "アン", "ユウコ", "メイ", "アヤノ", "コトネ", "サクラ", "メグミ", "アンナ", "ミウ", "ユウカ", "レナ", "ユイ", "アカネ", "ミホ", "アスカ", "アイコ", "ミオ", "ミドリ", "ユウスケ", "トシアキ", "カズワキ"]

Faker::Config.locale = :ja

# 1.user

50.times do |n|
  first_name_random = rand(first_names.length)
  last_name_random = rand(last_names.length)
  first_name = first_names[first_name_random]
  last_name = last_names[last_name_random]
  kana_first_name = kana_first_names[first_name_random]
  kana_last_name = kana_last_names[last_name_random]
  kana_first_name = kana_first_names
  postal_code = Faker::Address.postcode.to_s
  address = Faker::Address.state + Faker::Address.city
  phone_number = Faker::CellPhone.formats
  email = "example#{n}@gmail.com"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    kana_first_name: kana_first_name,
    kana_last_name: kana_last_name,
    postal_code: postal_code,
    address: address,
    phone_number: phone_number,
    email: email,
    password: 'password',
    password_confirmation: 'password'
  )
  Destination.create!(
    user_id: user.id,
    addressee: user.last_name + user.first_name,
    postal_code: user.postal_code,
    address: user.address
  )
end

# 2.products
kinds = ["チョコレート", "チーズ", "いちご", "コーヒー", "ミルク"]
genres = ["ケーキ", "プリン", "フィナンシェ", "キャンディ"]
5.times do |n|
  4.times do |i|
    name = kinds[n] + genres[i]
    price = (n + 1) * 100

    Product.create!(
      genre_id: (i + 1),
      name: name,
      introduction: "説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。説明です。",
      price: price
    )
  end
end

# 3.genres
Genre.create!(name: "ケーキ", validation: true)
Genre.create!(name: "プリン", validation: true)
Genre.create!(name: "焼き菓子", validation: true)
Genre.create!(name: "キャンディ", validation: true)

# 6.destinations
50.times do |n|
  first_name_random = rand(first_names.length)
  last_name_random = rand(last_names.length)
  first_name = first_names[first_name_random]
  last_name = last_names[last_name_random]

  addressee = last_name + first_name
  postal_code = Faker::Address.postcode.to_s
  address = Faker::Address.state + Faker::Address.city

  Destination.create!(
    user_id: (n + 1),
    addressee: addressee,
    postal_code: postal_code,
    address: address
  )
end


# 5.ordered_products
# 4.order_histories
50.times do |n|
  rand(1..3).times do |i|
    product_id = Product.find(rand(1..20)).id
    order_history_id = (n + 1)
    price = Product.find(product_id).price
    quantity = rand(1..5)

    OrderedProduct.create!(
      product_id: product_id,
      order_history_id: order_history_id,
      price: price,
      quantity: quantity
    )

  end

  user = User.find(rand(1..50))
  destination_random = rand(0..1)
  destination = user.destinations[destination_random]
  ordered_products = OrderedProduct.where(order_history_id: (n + 1))

  user_id = user.id
  addressee = destination.addressee
  postal_code = destination.postal_code
  address = destination.address
  payment_option = rand(1..2)
  billing = 800
    ordered_products.length.times do |k|
      billing += ( ordered_products.price * ordered_products.quantity ) * 1.1
    end

  OrderHistory.create!(
    user_id: user_id,
    addressee: addressee,
    postal_code: postal_code,
    address: address,
    payment_option: payment_option,
    billing: billing,
    created_at
  )

end



# 7.cart_products
# user_id
# product_id
# quantity

# 8.admin_users
AdminUsers.create!(
  email: admin@gmail.com,
  password: 'password',
  password_confirmation: 'password'
)

t = Time.current
50.times do |n|
  name = Faker::Company.name
  date = Faker::Date.between(from:2.month.ago, to: 2.month.from_now)
  start_time_raw = t.beginning_of_day.since(n.to_i.hours)
  start_time = start_time_raw.strftime("%H:%M:%S")
  ending_time = start_time_raw.since(1.hours).strftime("%H:%M:%S")

  Task.create!(
    name: name,
    date: date,
    start_time: start_time,
    ending_time: ending_time
  )
end
