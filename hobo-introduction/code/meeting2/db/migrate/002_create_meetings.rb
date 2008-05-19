class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.string   :title
      t.text     :body
      t.datetime :date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :meetings
  end
end
