## 洗濯機シェアアプリ
![image](https://user-images.githubusercontent.com/68495404/103567287-e4165900-4f06-11eb-9aeb-27c4c0b68402.png)

## 概要
洗濯機が置けない、急に故障して使えなくなった――。<br>
そんな方はまずコインランドリーを探すのではないでしょうか。<br>
でももっと近くで、しかもコインランドリーより安く洗濯できるとしたら素晴らしくないですか？<br>
洗濯機を貸してくださる優しいあなたは、空いた時間にちょっとしたお小遣い稼ぎができます！<br>

### 制作背景
* 制作のきっかけは、PDFをプリントアウトするのにコンビニじゃなくて近所でプリンターを借りれたら便利なのに、と思ったことからでした。ポイントのやり取りで近所で何かをシェアしあえるアプリを考えていたとき、ふとコインランドリーが目に止まり、洗濯機なら1回100円200円で貸す人はいるだろうし、借りる人もコインランドリーより毎回100円200円安く洗濯できるなら利用するだろうと思いました。類似のアプリやサービスもないようなので制作に踏み切りました。

### 工夫したポイント
* 右側のメニューボタンを各画面で必要な機能だけに絞り、シンプルなデザインと使いやすさを意識しました。
* 受付中の洗濯機だけマーカー表示されるようにした一方、提供者が管理しやすいように一覧表示から詳細ページ（ここから編集・お問い合わせ確認ができる）に移動できるようにしました。

## テストアカウント
[URL https://tad5.herokuapp.com/](https://tad5.herokuapp.com/)
### テスト用アカウント
* メールアドレス<br>
      user@test
* パスワード<br>
      usertest

## 主な機能
### 主な機能
* ログイン・ログアウト
* このアプリは、アプリ内ポイントを使ってサービスを利用できる
* ポイントは初回お試しで付与される他、サービス提供や広告視聴で貯めることができる
* 利用したい地域を入力して地図を移動できる
* すぐに使えるサービス(洗濯機)のみマーカー表示され、マーカーから詳細ページに遷移できる
* 詳細ページではチャット機能が使えたり、リクエストを送ることができる
* 送ったリクエスト、受けたリクエストは一覧で確認できる
* リクエストを送ったユーザーは、承認されるまではキャンセルができる
* リクエストを受けたユーザーが承認するとポイントの移動が行われる
* ポイントの増減は一覧で確認できる
* 貯めたポイントは景品と交換できる

### 使い方
* ログインします。
* 利用したい地域に移動できます。
![image](https://user-images.githubusercontent.com/68495404/103570487-82f18400-4f0c-11eb-84a4-153148e42f82.png)
* 移動した付近の、待機中の洗濯機がマーカー表示されます。
![image](https://user-images.githubusercontent.com/68495404/103567887-ec22c880-4f07-11eb-9046-faf0c85654c8.png)
* マーカーをクリック→詳細ページに移動します。
![image](https://user-images.githubusercontent.com/68495404/103567941-00ff5c00-4f08-11eb-9c35-11c871a16b22.png)
* ”お問い合わせ”ではLINE風のチャットができます。
![image](https://user-images.githubusercontent.com/68495404/103568864-af57d100-4f09-11eb-9eea-ad0808d44e19.png)
* 右側の「リクエストを送る」ボタンを押すと次の画面になります。ここではポイントの移動はまだありません。
![image](https://user-images.githubusercontent.com/68495404/103568927-ca2a4580-4f09-11eb-9f83-bc0ed501235f.png)
* 送信したリクエストとその状態を確認できます。未承認のうちはキャンセルが可能です。
![image](https://user-images.githubusercontent.com/68495404/103569062-fb0a7a80-4f09-11eb-9234-e7f68d129c6b.png)
* リクエストを受け取った相手が「承認」するとポイントが移動します。この例では自分から相手にポイントが150P移動しました。
![image](https://user-images.githubusercontent.com/68495404/103570731-fbf0db80-4f0c-11eb-9e4a-d2bf5eb6c1b9.png)
![image](https://user-images.githubusercontent.com/68495404/103570806-1a56d700-4f0d-11eb-8b24-ef11cdf32cab.png)
* ポイントメニューからはポイントの増減履歴が確認できます。
![image](https://user-images.githubusercontent.com/68495404/103569264-576d9a00-4f0a-11eb-8c6c-88c244e52137.png)
![image](https://user-images.githubusercontent.com/68495404/103583517-2b124780-4f23-11eb-8712-484aa167867d.png)
* ポイントメニューには他に、広告視聴によるポイント付加機能(模擬的に1クリックで100P付与)とポイントを景品と交換する機能があります。
![image](https://user-images.githubusercontent.com/68495404/103583590-4f6e2400-4f23-11eb-93b5-07a3b60f5fb9.png)

## 仕様
* rails 6.0.0

## 課題や今後実装したい機能
### 課題
* 時刻がPCの時刻とずれる不具合を修正予定
### 今後実装したい機能
* ポイントをカード決済で購入できる機能

## DB設計

### users テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| email                      | string     | null: false, default: ""       |
| encrypted_password         | string     | null: false, default: ""       |

### Association

- has_one :area
- has_one :wallet
- has_many :chats
- has_many :gifts
- has_many :items

### areas テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| address                    | text       | null: false                    |
| latitude                   | float      | null: false                    |
| longitude                  | float      | null: false,                   |
| user                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

### items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| wash_power_id              | integer    |                                |
| status_id                  | integer    | null: false                    |
| address                    | text       | null: false                    |
| point                      | integer    | null: false                    |
| comment                    | text       | null: false                    |
| user                       | references | null: false, foreign_key: true |
| latitude                   | float      | null: false                    |
| longitude                  | float      | null: false,                   |

### Association
- belongs_to :user
- has_many :orders
- has_one :chat

### wallets テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| point                      | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :receipts

### receipts テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| point                      | integer    | null: false                    |
| reason                     | string     | null: false                    |
| wallet                     | references | null: false, foreign_key: true |

### Association
- belongs_to :wallet

### orders テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| point                      | integer    | null: false                    |
| status                     | integer    | null: false, default: 0        |
| taker                      | integer    | null: false                    |
| giver                      | integer    | null: false                    |
| item                       | references | null: false, foreign_key: true |

### Association
- belongs_to :item

### chats テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| item                       | references | null: false, foreign_key: true |
| user                       | references | null: false, foreign_key: true |
| message                    | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

### gifts テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| gift_id                    | integer    | null: false                    |
| point                      | integer    | null: false                    |
| name                       | string     | null: false                    |
| address                    | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
