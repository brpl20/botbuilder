class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:ai_agent, :user)
                      .order(created_at: :desc)

    if @messages.empty? && Rails.env.development?
      # Create a sample message in development environment
      Message.create!(
        chat_id: "sample-chat-123",
        phone_number: "+1234567890",
        content: "Hello World! This is a sample message.",
        message_type: "text",
        sender_type: "user"
      )
      @messages = Message.all.order(created_at: :desc)
    end
  end

  def show
    @message = Message.find(params[:id])
  end
end
