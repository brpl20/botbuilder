require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
    @user = users(:one)
    log_in_as(@user)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "should display message details" do
    visit messages_url
    click_on "View", match: :first
    
    assert_text @message.content
    assert_text @message.chat_id
    assert_text @message.phone_number
  end

  test "should display no messages message when empty" do
    Message.destroy_all
    visit messages_url
    
    assert_text "No Messages Found"
    assert_text "There are currently no messages in the system."
  end
end
