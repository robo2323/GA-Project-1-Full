class PresetsController < ApplicationController
  before_action :set_preset, only: [:show, :edit, :update, :destroy]

  # GET /presets
  # GET /presets.json
  def index
    @presets = if @current_user.present?
                 @current_user.presets.all
               else
                 redirect_to presets_all_path
               end
  end

  def all
    @presets = if @current_user.present?
                 Preset.where.not(user_id: @current_user.id)
               else
                 Preset.all
               end
  end

  # GET /presets/1
  # GET /presets/1.json
  def show
  end

  # GET /presets/new
  def new
    @preset = Preset.new
  end

  # GET /presets/1/edit
  def edit
    if @preset.user_id != @current_user.id
      redirect_to presets_path
    end
  end

  # POST /presets
  # POST /presets.json
  def create
    @preset = Preset.new(preset_params)

    respond_to do |format|
      if @preset.save
        format.html { redirect_to @preset, notice: 'Preset was successfully created.' }
        format.json { render :show, status: :created, location: @preset }
      else
        format.html { render :new }
        format.json { render json: @preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presets/1
  # PATCH/PUT /presets/1.json
  def update
    respond_to do |format|
      if @preset.update(preset_params)
        format.html { redirect_to @preset, notice: 'Preset was successfully updated.' }
        format.json { render :show, status: :ok, location: @preset }
      else
        format.html { render :edit }
        format.json { render json: @preset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presets/1
  # DELETE /presets/1.json
  def destroy
    if @preset.user_id == @current_user.id

      @preset.destroy
      respond_to do |format|
        format.html { redirect_to presets_url, notice: 'Preset was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      redirect_to presets_path

    end


  end


  private
  # Use callbacks to share common setup or constraints between actions.

  def set_preset
    @preset = Preset.find(params[:id])
  end

  def preset_is_users?(preset)

    preset.user_id == @current_user.id if @current_user.present?
  end

  helper_method :preset_is_users?

  # Never trust parameters from the scary internet, only allow the white list through.
  def preset_params
    params.require(:preset).permit(:name, :user_id)
  end

end
