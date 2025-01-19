class CreateInstructions < ActiveRecord::Migration[8.0]
  def change
    create_table :instructions do |t|
      t.text :content
      t.references :ai_agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
