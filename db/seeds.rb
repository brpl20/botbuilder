# Create AI Providers
openai = AiProvider.find_or_create_by!(name: 'OpenAI')
anthropic = AiProvider.find_or_create_by!(name: 'Anthropic')
google = AiProvider.find_or_create_by!(name: 'Google')

# Create AI Models for OpenAI
[
  'gpt-4o',
  'chatgpt-4o-latest',
  'gpt-4o-mini',
  '01',
  '01-mini',
  '01-preview',
  'gpt-4o-realtime-preview',
  'gpt-4o-mini-realtime-preview',
  'gpt-4o-audio-preview'
].each do |model_name|
  openai.ai_models.find_or_create_by!(name: model_name)
end

# Create AI Models for Anthropic
[
  'claude-3-5-sonnet-20241022 (latest)',
  'claude-3-5-sonnet-20240620',
  'claude-3-5-haiku-20241022 (latest)',
  'claude-3-opus-20240229 (latest)',
  'claude-3-haiku-20240307'
].each do |model_name|
  anthropic.ai_models.find_or_create_by!(name: model_name)
end

# Create AI Models for Google
[
  'Gemini 2.0 Flash (experimental)',
  'Gemini 1.5 Flash',
  'Gemini 1.5 Flash-8B',
  'Gemini 1.5 Pro'
].each do |model_name|
  google.ai_models.find_or_create_by!(name: model_name)
end

# Create a sample AI Agent if none exists
if AiAgent.count == 0
  agent = AiAgent.create!(
    name: "Sample AI Agent",
    persona: "A helpful assistant",
    ai_provider: openai
  )

  agent.instructions.create!([
    { content: "Be polite and helpful." },
    { content: "Provide accurate information." }
  ])
end
