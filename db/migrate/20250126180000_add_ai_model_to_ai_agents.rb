class AddAiModelToAiAgents < ActiveRecord::Migration[8.0]
  def change
    add_reference :ai_agents, :ai_model, foreign_key: true, null: true
  end
end
