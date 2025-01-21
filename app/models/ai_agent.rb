class AiAgent < ApplicationRecord
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank


  def to_json(options = {})
    options[:include] = :instructions
    options[:except] ||= []
    options[:except] += [ :created_at, :updated_at ]
    super(options)
  end
end
