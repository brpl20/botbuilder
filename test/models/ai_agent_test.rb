require "test_helper"

class AiAgentTest < ActiveSupport::TestCase
  def setup
    @ai_agent = AiAgent.new(
      name: "Test Agent",
      persona: "A helpful test assistant"
    )
  end

  test "should be valid" do
    assert @ai_agent.valid?
  end

  test "name should be present" do
    @ai_agent.name = "   "
    assert_not @ai_agent.valid?
  end

  test "persona should be present" do
    @ai_agent.persona = "   "
    assert_not @ai_agent.valid?
  end
end
