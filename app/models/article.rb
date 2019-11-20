class Article < ApplicationRecord
  include RankedModel

  has_many :heads, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :relations, dependent: :destroy
  has_one  :position, dependent: :destroy

end
