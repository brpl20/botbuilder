class AiAgent < ApplicationRecord
  belongs_to :ai_provider, optional: true
  belongs_to :ai_model, optional: true
  has_many :instructions, dependent: :destroy
  has_one_attached :photo_instruction

  validates :name, presence: true
  validates :persona, presence: true

  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank

  def to_json(options = {})
    options[:include] = [ :instructions, :ai_provider ]
    options[:except] ||= []
    options[:except] += [ :created_at, :updated_at ]
    super(options)
  end
end
