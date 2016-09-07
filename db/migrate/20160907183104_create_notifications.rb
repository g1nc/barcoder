class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :text
      t.string :link
      t.timestamps
    end

    create_table :contacts_notifications, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :notification, index: true
    end
  end
end
