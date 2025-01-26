class CreateAiProvidersAndModels < ActiveRecord::Migration[8.0]
  def change
    create_table :ai_providers do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :ai_providers, :name, unique: true

    create_table :ai_models do |t|
      t.string :name, null: false
      t.references :ai_provider, null: false, foreign_key: true
      t.timestamps
    end
    add_index :ai_models, [:name, :ai_provider_id], unique: true

    add_reference :ai_agents, :ai_provider, foreign_key: true
  end
end
