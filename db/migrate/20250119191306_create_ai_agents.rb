class CreateAiAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :ai_agents do |t|
      t.string :name
      t.text :persona

      t.timestamps
    end
  end
end
