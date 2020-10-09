class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :friend_id, index: true, foreign_key: {to_table: :users}
      t.boolean :confirmed
      t.timestamps
    end
  end
end
