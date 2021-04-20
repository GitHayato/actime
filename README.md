# DB設計
## Userテーブル
| Columns             | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| username            | string | null: false                |
| encrypted_password  | string | null: false                |
| email               | string | null: false, unique: true  |
| public_uid          | string | null: false, unique: true  |
| introduction        | string | null: false                |
### Association
- has_many :messages
- has_many :rooms
- has_many :watches
- has_many :room_users
- has_many :sns_credentials
- has_many :relationships

## Messageテーブル
| Columns             | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | string     | null: false                    |
| room_id             | references | foreign_key: true, null: false |
| user_id             | references | foreign_key: true, null: false |
### Association
- belongs_to :user
- belongs_to :room

## Watchテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| watch               | integer    | null: false                |
| event_id            | references | foreign_key: true          |
| distance_id         | references | foreign_key: true          |
| user_id             | references | foreign_key: true          |
### Association
- belongs_to :user
- belongs_to :room
- belongs_to :event
- belongs_to :distance

## Roomテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| thread_name         | string     | null: false                |
| public_uid          | string     | null: false, unique: true  |
### Association
- has_many :room_users
- has_many :users
- has_many :messages
- has_many :watches

## Room_userテーブル
| Columns             | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | foreign_key: true, null: false |
| room_id             | references | foreign_key: true, null: false |
### Association
- belongs_to :room
- belongs_to :user

## Eventテーブル
| Columns             | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| event               | string     | null: false                    |
| room_id             | references | foreign_key: true, null: false |
### Association
- has_one :watch

## Distanceテーブル
| Columns             | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| distance            | string     | null: false                    |
| room_id             | references | foreign_key: true, null: false |
### Association
- has_one :watch

## Relationshipsテーブル
| Columns             | Type       | Options                                      |
| ------------------- | ---------- | -------------------------------------------- |
| user_id             | references | foreign_key: true, null: false               |
| follow_id           | references | foreign_key: true, null: false, unique: true |
### Association
- belongs_to :user

## Sns_credentialテーブル
| Columns             | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| provider            | string     | null: false                |
| uid                 | string     | null: false                |
| user_id             | references | foreign_key: true          |
### Association
- belongs_to :user