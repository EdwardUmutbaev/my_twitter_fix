class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index(:friendships, :follower_id)
    add_index(:friendships, :followed_id)
  end

  def self.down
    drop_table :friendships
  end
end
