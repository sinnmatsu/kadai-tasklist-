class AddUserToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user, foreign_key: true
    #外部キーによってtasksのデータとuserのデータの整合性を高めてエラーを回避することができる
  end
end
