class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.references :topic, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
