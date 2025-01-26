class AiProvider < ApplicationRecord
  has_many :ai_models, dependent: :destroy
  has_many :ai_agents, dependent: :nullify
  
  validates :name, presence: true, uniqueness: true
end
