class List < ApplicationRecord
  has_one_attached :image
  
  # ---- 以下を追加してください ---- #
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true, blob: { content_type: :image }
end
