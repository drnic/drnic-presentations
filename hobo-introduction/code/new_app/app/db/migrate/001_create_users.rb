class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :salt, :limit => 40
      t.datetime :updated_at
      t.string   :crypted_password, :limit => 40
      t.string   :username
      t.datetime :remember_token_expires_at
      t.boolean  :administrator, :default => false
      t.string   :remember_token
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :users
  end
end
