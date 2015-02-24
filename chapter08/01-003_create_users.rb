class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
    end
    add_column :stories, :user_id, :integer
    add_column :votes, :user_id, :integer
  end

  def self.down
    drop_table :users
    remove_column :stories, :user_id
    remove_column :votes, :user_id
  end
end