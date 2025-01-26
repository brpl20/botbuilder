class CreateAiProvidersAndModels < ActiveRecord::Migration[8.0]
  def change
    # First create ai_providers
    create_table :ai_providers do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :ai_providers, :name, unique: true

    # Then create ai_models with reference to ai_providers
    create_table :ai_models do |t|
      t.string :name, null: false
      t.references :ai_provider, null: false, foreign_key: true
      t.timestamps
    end
    add_index :ai_models, [ :name, :ai_provider_id ], unique: true

    # Finally add the reference to ai_agents
    add_reference :ai_agents, :ai_provider, foreign_key: true, null: true
  end
end
