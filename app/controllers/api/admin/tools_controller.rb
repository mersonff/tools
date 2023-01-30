class Api::Admin::ToolsController < Api::Admin::AdminController
  before_action :set_tool, only: %i[show edit update destroy]

  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool
      .ransack(search_params)
      .result
      .order(:name)
      .page(params[:page])
      .per(params[:per_page])    
  end

  # GET /tools/1
  # GET /tools/1.json
  def show; end

  def new
    @tool = Tool.new
  end

  def edit; end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      render :edit, status: :created, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    if @tool.update(tool_params)
      render :edit, status: :ok, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tool
    @tool = Tool.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tool_params
    params.require(:tool).permit(:code, :name, :brand, :kind, :observations, :image, :place_id)
  end
end