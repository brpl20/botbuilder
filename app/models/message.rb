class Message < ApplicationRecord
  belongs_to :ai_agent, optional: true
  belongs_to :user, optional: true

  validates :content, presence: true
  validates :message_type, presence: true
  validates :chat_id, presence: true
  validates :phone_number, presence: true

  enum :message_type, {
    text: "text",
    image: "image",
    video: "video",
    audio: "audio",
    document: "document"
  }, default: "text"

  enum :sender_type, {
    user: "user",
    contact: "contact",
    bot: "bot"
  }, default: "user"
end
