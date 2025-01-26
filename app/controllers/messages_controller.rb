class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:ai_agent, :user)
                      .order(created_at: :desc)
                      .page(params[:page])
  end

  def show
    @message = Message.find(params[:id])
  end
end
