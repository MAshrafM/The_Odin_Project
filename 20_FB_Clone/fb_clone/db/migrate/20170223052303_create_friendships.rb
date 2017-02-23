class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.boolean :friends, default: false
      t.integer :request_from_id
      t.integer :request_to_id

      t.timestamps null: false
    end
    add_index :friendships, :request_from_id
    add_index :friendships, :request_to_id
    add_index :friendships, [ :request_from_id, :request_to_id ], unique: true
  end
end
