## アプリケーション名
Learning Efficiency
## アプリケーション概要
このアプリケーションでできることを記述しましょう。
## URL
デプロイ済みのURLを記述しましょう。
## テスト用アカウント
ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
## 利用方法
このアプリケーションの利用方法を説明しましょう。
## 目指した課題解決
このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
## 洗い出した要件
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
## 実装予定の機能
洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
## ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
## データベース設計
ER図等を添付しましょう。

# ER図

# テーブル設計
 
## users テーブル
 
| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| password     | string | null: false |
 
### Association
 
- has_many :questions
- has_many :answers
- has_many :time_managements
 
## questions テーブル
 
| Column                 | Type       | Options                        |
| -------------------    | ------     | -------------------------------|
| title                  | string     | null: false                    |
| content                | text       | null: false                    |
| user_id                | references | null: false, foreign_key: true |

### Association
 
- belongs_to :user
- has_many :answers
 
## answers テーブル
 
| Column        | Type       | Options                        |
| ------------- | ------     | -------------------------------|
| feedback      | integer    | null: false                    |
| content       | text       | null: false                    |
| question_id   | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association
 
- belongs_to :user
- belongs_to :question
 
## time_managements テーブル
 
| Column              | Type       | Options                        |
| ------------------- | ------     | -------------------------------|
| date                | date       | null: false                    |
| time                | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
 
- belongs_to :user

