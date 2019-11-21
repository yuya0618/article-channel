# Features/機能


# DB設計

[article_table.pdf](https://github.com/yuya0618/article-channel/files/3873298/article_table.pdf)

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|explanation|string||
### Association
- has_many :heads, dependent: :destroy
- has_many :texts, dependent: :destroy
- has_many :relations, dependent: :destroy
- has_many :positions, dependent: :destroy

## headsテーブル
|Column|Type|Options|
|------|----|-------|
|head|string|null: false|
|article_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :article
- has_one :position, dependent: :destroy

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|texts|text|null: false|
|article_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :article
- has_one :position, dependent: :destroy

## relationsテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :article
- has_one :position, dependent: :destroy

## positionsテーブル
|Column|Type|Options|
|------|----|-------|
|position|integer|null: false|
|head_id|bigint|foreign_key: true|
|text_id|bigint|foreign_key: true|
|relation_id|bigint|foreign_key: true|
|article_id|bigint|foreign_key: true|
### Association
- belongs_to :head, optional: true
- belongs_to :text, optional: true
- belongs_to :relation, optional: true
- belongs_to :article
