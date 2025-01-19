require "application_system_test_case"

class AiAgentsTest < ApplicationSystemTestCase
  setup do
    @ai_agent = ai_agents(:one)
  end

  test "visiting the index" do
    visit ai_agents_url
    assert_selector "h1", text: "Ai agents"
  end

  test "should create ai agent" do
    visit ai_agents_url
    click_on "New ai agent"

    fill_in "Name", with: @ai_agent.name
    fill_in "Persona", with: @ai_agent.persona
    click_on "Create Ai agent"

    assert_text "Ai agent was successfully created"
    click_on "Back"
  end

  test "should update Ai agent" do
    visit ai_agent_url(@ai_agent)
    click_on "Edit this ai agent", match: :first

    fill_in "Name", with: @ai_agent.name
    fill_in "Persona", with: @ai_agent.persona
    click_on "Update Ai agent"

    assert_text "Ai agent was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai agent" do
    visit ai_agent_url(@ai_agent)
    click_on "Destroy this ai agent", match: :first

    assert_text "Ai agent was successfully destroyed"
  end
end
