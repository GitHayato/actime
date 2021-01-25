# DB設計
## Userテーブル
| Columns             | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| username            | string | null: false                |
| encrypted_password  | string | null: false                |
| email               | string | null: false, unique: true  |