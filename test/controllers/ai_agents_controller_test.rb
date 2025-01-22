require "test_helper"

class AiAgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_agent = ai_agents(:one)
    @user = create_user(email: "zicatestor@gmail.com", password: "blobor")
    log_in_as(@user)
  end

  teardown do
    log_out
  end

  test "should get index" do
    get ai_agents_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_agent_url
    assert_response :success
  end

  test "should create ai_agent" do
    assert_difference("AiAgent.count") do
      post ai_agents_url, params: { ai_agent: { name: @ai_agent.name, persona: @ai_agent.persona } }
    end

    assert_redirected_to ai_agent_url(AiAgent.last)
  end

  test "should show ai_agent" do
    get ai_agent_url(@ai_agent)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_agent_url(@ai_agent)
    assert_response :success
  end

  test "should update ai_agent" do
    patch ai_agent_url(@ai_agent), params: { ai_agent: { name: @ai_agent.name, persona: @ai_agent.persona } }
    assert_redirected_to ai_agent_url(@ai_agent)
  end

  test "should destroy ai_agent" do
    assert_difference("AiAgent.count", -1) do
      delete ai_agent_url(@ai_agent)
    end

    assert_redirected_to ai_agents_url
  end
end
