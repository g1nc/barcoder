class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name,  null: false
      t.string :phone, null: false
      t.string :token, null: false
      t.string :code,  null: false
      t.timestamps
    end

    add_index :contacts, :name,  unique: true
    add_index :contacts, :phone, unique: true
  end
end
