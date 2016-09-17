class EditNotificationTable < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :topic_id, :integer

    create_table :contacts_topics, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :topic, index: true
    end
  end
end
