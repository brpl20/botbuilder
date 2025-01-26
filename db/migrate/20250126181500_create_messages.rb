class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :chat_id, null: false
      t.string :phone_number, null: false
      t.text :content, null: false
      t.string :message_type, null: false
      t.string :sender_type, null: false
      t.boolean :is_contact
      t.references :ai_agent, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :messages, :chat_id
    add_index :messages, :phone_number
  end
end
