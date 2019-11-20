class Text < ApplicationRecord
  belongs_to :article
  has_one :position, dependent: :destroy
end
