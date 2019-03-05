class Task < ApplicationRecord
  #ここでモデル名を確認することができる
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 10 }
  belongs_to :user
  #Task.userでそのタスクを投稿したUserを取得することができる
end
