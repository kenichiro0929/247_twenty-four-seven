class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
  	add_index :users, :email, unique: true
  end
end

# usersテーブルemailカラムにインデックスを追加し一意性を付ける