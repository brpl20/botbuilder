require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
  end

  test "should show no messages message when empty" do
    Message.destroy_all
    get messages_url
    assert_response :success
    assert_select "article header", "No Messages Found"
  end
end
