require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new(
      chat_id: "chat-123",
      phone_number: "+1234567890",
      content: "Test message",
      message_type: "text",
      sender_type: "user"
    )
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "content should be present" do
    @message.content = "   "
    assert_not @message.valid?
  end

  test "chat_id should be present" do
    @message.chat_id = "   "
    assert_not @message.valid?
  end

  test "phone_number should be present" do
    @message.phone_number = "   "
    assert_not @message.valid?
  end

  test "message_type should be present" do
    @message.message_type = "   "
    assert_not @message.valid?
  end

  test "should have valid message_type" do
    valid_types = ['text', 'image', 'video', 'audio', 'document']
    valid_types.each do |type|
      @message.message_type = type
      assert @message.valid?, "#{type} should be valid"
    end
  end

  test "should have valid sender_type" do
    valid_types = ['user', 'contact', 'bot']
    valid_types.each do |type|
      @message.sender_type = type
      assert @message.valid?, "#{type} should be valid"
    end
  end
end
