# Features/機能
### ◯記事のタイトルと本文の「編集」と、「自動保存」（非同期通信）
![auto_save](https://user-images.githubusercontent.com/52994356/69315824-d3f7d780-0c7a-11ea-876f-2695a2f1be91.gif)

### ◯記事の内容を「見出し」「本文」「関連記事」の種類から選んで投稿（非同期通信）
![create](https://user-images.githubusercontent.com/52994356/69315839-dc501280-0c7a-11ea-9fd3-9adbd2cd4b02.gif)

### ◯各記事内容の要素の「削除」（非同期通信）
![delete](https://user-images.githubusercontent.com/52994356/69315844-deb26c80-0c7a-11ea-86a6-7a9764135f50.gif)

### ◯各記事内容の要素のドラッグアンドドロップで「並び替え」(非同期通信）
![sort](https://user-images.githubusercontent.com/52994356/69315847-e245f380-0c7a-11ea-8938-561fffaa6f30.gif)

# DB設計

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
|text|text|null: false|
|article_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :article
- has_one :position, dependent: :destroy

## relationsテーブル
|Column|Type|Options|
|------|----|-------|
|relation|integer|null: false|
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
