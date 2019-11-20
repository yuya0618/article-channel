class Position < ApplicationRecord
  # レコード作成時にpositionをarticle_idでグルーピングして作成
  include RankedModel
  ranks :position , with_same: :article_id

  belongs_to :head, optional: true
  belongs_to :text, optional: true
  belongs_to :relation, optional: true
  belongs_to :article
end
