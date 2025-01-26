class AiModel < ApplicationRecord
  belongs_to :ai_provider

  validates :name, presence: true
  validates :name, uniqueness: { scope: :ai_provider_id }
end
