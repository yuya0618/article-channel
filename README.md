# articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|explanation|string||
## Association
- has_many :heads
- has_many :texts
- has_many :relations

# headsテーブル
|Column|Type|Options|
|------|----|-------|
|head|string|null: false|
|article_id|integer|null: false, foreign_key: true|
##Association
- belongs_to :article

# textsテーブル
|Column|Type|Options|
|------|----|-------|
|texts|text|null: false|
|article_id|integer|null: false, foreign_key: true|
##Association
- belongs_to :article

# relationsテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|integer|null: false, foreign_key: true|
##Association
- belongs_to :article