# DB設計
## Userテーブル
| Columns             | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| username            | string | null: false                |
| encrypted_password  | string | null: false                |
| email               | string | null: false, unique: true  |
### Association
- has_many :messages
- has_many :threads
- has_many :watches


## Messageテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| content             | string     | null: false                |
| thread_id           | references | foreign_key: true          |
| user_id             | references | foreign_key: true          |
### Association
- belongs_to :user
- belongs_to :thread
- has_many :watches

## Watchテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| watch               | integer    | null: false                |
| event               | string     |                            |
| distance            | string     |                            |
| user_id             | references | foreign_key: true          |
### Association
- belongs_to :user
- belongs_to :message

## threadテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| thread_name         | string     | null: false                 |
| user_id             | references | foreign_key: true          |
### Association
- belongs_to :user
- has_many :messages