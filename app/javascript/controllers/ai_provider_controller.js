import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  loadModels(event) {
    const providerId = event.target.value
    if (!providerId) return

    fetch(`/ai_agents/models_for_provider?ai_provider_id=${providerId}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => {
      document.getElementById("ai-model-select").innerHTML = html
    })
  }
}
