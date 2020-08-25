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
 
## time_managers テーブル
 
| Column              | Type       | Options                        |
| ------------------- | ------     | -------------------------------|
| time                | time       | null: false                    |
| user_id             | references | null: false, foreign_key: true |
 
- belongs_to :user

