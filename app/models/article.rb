class Article < ApplicationRecord
  has_many :heads, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :relations, dependent: :destroy

end
