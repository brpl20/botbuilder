require "application_system_test_case"

class AiAgentsTest < ApplicationSystemTestCase
  setup do
    @ai_agent = ai_agents(:one)
    @user = User.create(email_address: "zicatestor@gmail.com", password: "blobor") # Adjust to match your user creation logic
    log_in_as(@user) # Log in the user
  end

  test "visiting the index" do
    visit ai_agents_url
    # puts page.html
    assert_selector "h1", text: "Ai agents"
  end

  test "should create ai agent" do
    visit ai_agents_url
    click_on "New ai agent"

    fill_in "Name", with: @ai_agent.name
    fill_in "Persona", with: @ai_agent.persona
    click_on "Save AI Agent"

    assert_text "Ai agent was successfully created"
    click_on "Back"
  end

  test "should update Ai agent" do
    visit ai_agent_url(@ai_agent)
    click_on "Edit this AI agent", match: :first

    fill_in "Name", with: @ai_agent.name
    fill_in "Persona", with: @ai_agent.persona
    click_on "Save AI Agent"

    assert_text "Ai agent was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai agent" do
    visit ai_agent_url(@ai_agent)
    click_on "Destroy this AI agent", match: :first

    assert_text "Ai agent was successfully destroyed"
  end

  private

  # Login helper
  def log_in_as(user)
    visit "/session/new" # Use your custom login path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: "blobor"
    click_on "Log in" # Replace with your login button text
    assert_text "Logado" # Confirm login
    puts user.email_address
    puts "usuário logado!"
  end

  # Logout helper
  def log_out
    # Debug: Print the authentication state
    if defined?(Current.user)
      puts "Current user: #{Current.user.email_address}"
    else
      puts "No user is authenticated"
    end

    # Confirm the user is logged in
    assert_text "zicatestor@gmail.com" # Replace with the actual user email

    # Confirm the logout button is rendered
    within("header nav.container-fluid") do
      assert_selector "form.button_to button", text: "Deslogar", wait: 5
    end

    # Wait for the logout button and click it
    within("header nav.container-fluid") do
      find("form.button_to button", text: "Deslogar", wait: 5).click
    end

    # Confirm logout by checking for a success message
    assert_text "Deslogado" # Replace with the actual logout success message
  end
end
