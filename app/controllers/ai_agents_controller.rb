class AiAgentsController < ApplicationController
  before_action :set_ai_agent, only: %i[ show edit update destroy ]

  # GET /ai_agents or /ai_agents.json
  def index
    @ai_agents = AiAgent.all
  end

  # GET /ai_agents/1 or /ai_agents/1.json
  def show
    respond_to do |format|
      format.html
      format.json do
        render json: @ai_agent.as_json(
          include: {
            instructions: { only: [ :id, :content ] }
                   },
          except: [ :created_at, :updated_at ]
        )
      end
    end
  end

  # GET /ai_agents/new
  def new
    @ai_agent = AiAgent.new
    @ai_agent.instructions.build
  end

  # GET /ai_agents/1/edit
  def edit
  end

  # POST /ai_agents or /ai_agents.json
  def create
    @ai_agent = AiAgent.new(ai_agent_params)

    respond_to do |format|
      if @ai_agent.save
        format.html { redirect_to @ai_agent, notice: "Ai agent was successfully created." }
        format.json { render :show, status: :created, location: @ai_agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_agents/1 or /ai_agents/1.json
  def update
    @ai_agent.instructions.build if @ai_agent.instructions.empty?
    respond_to do |format|
      if @ai_agent.update(ai_agent_params)
        format.html { redirect_to @ai_agent, notice: "Ai agent was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_agents/1 or /ai_agents/1.json
  def destroy
    @ai_agent.destroy!

    respond_to do |format|
      format.html { redirect_to ai_agents_path, status: :see_other, notice: "Ai agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def models_for_provider
    @ai_provider = AiProvider.find(params[:ai_provider_id])
    @ai_models = @ai_provider.ai_models
    
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: turbo_stream.update(
          "ai-model-select",
          partial: "ai_model_select",
          locals: { ai_models: @ai_models }
        )
      }
      format.html { 
        render partial: "ai_model_select", 
        locals: { ai_models: @ai_models } 
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_agent
      @ai_agent = AiAgent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_agent_params
      params.require(:ai_agent).permit(:name, :persona, :ai_provider_id, :ai_model_id, 
                                     instructions_attributes: [ :id, :content, :_destroy ])
    end
end
