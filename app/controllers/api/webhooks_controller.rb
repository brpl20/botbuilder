module Api
  class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    allow_unauthenticated_access only: [ :chat, :qr_code ]

    def chat
      begin
        # Parse the incoming webhook data
        chat_data = {
          chat_id: params[:chat_id],
          phone_number: params[:phone_number],
          message_body: params[:message_body],
          is_contact: params[:is_contact],
          message_type: params[:message_type],
          sender: params[:sender]
        }

        # Log the incoming message
        Rails.logger.info "Received chat webhook: #{chat_data.inspect}"

        # Here you would process the message according to your business logic
        # For example, routing it to the appropriate AI agent

        render json: { status: "success" }, status: :ok
      rescue => e
        Rails.logger.error "Webhook processing error: #{e.message}"
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end

    def qr_code
      begin
        response = HTTP.get("localhost/api/getQRcode")
        render json: response.body, status: response.status
      rescue HTTP::Error => e
        Rails.logger.error "QR code fetch error: #{e.message}"
        render json: { error: "Failed to fetch QR code" }, status: :service_unavailable
      rescue => e
        Rails.logger.error "Unexpected error: #{e.message}"
        render json: { error: "Internal Server Error" }, status: :internal_server_error
      end
    end
  end
end
