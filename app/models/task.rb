class Task < ApplicationRecord
  #ここでモデル名を確認することができる
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 10 }
end
