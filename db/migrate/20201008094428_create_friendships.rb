class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend, index: true, foreign_key: { to_table: :user }
      t.timestamps
    end
  end
end
