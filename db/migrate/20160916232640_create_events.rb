class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :topic_id
      t.string :title
      t.date :date
      t.string :time
      t.text :description

      t.timestamps
    end
  end
end
