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
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /presets/1
  # PATCH/PUT /presets/1.json
  def update

    @preset.update(preset_params)
    flash[:notice] = 'Preset was successfully updated.'
    redirect_to @preset

  end

  # DELETE /presets/1
  # DELETE /presets/1.json
  def destroy
    if @preset.user_id == @current_user.id

      @preset.destroy
      respond_to do |format|
        format.html { redirect_to presets_url, notice: 'Preset was successfully deleted.' }
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

  def avg_rating(preset)
    if preset.ratings.present?
      arr = preset.ratings.pluck(:rating)
      arr.compact!
      @rating = (arr.sum.to_f / arr.size).round
    end

  end

  helper_method :avg_rating

  def new_comment
    @comment = Comment.new
  end

  helper_method :new_comment

  def create_comment
    @comment = Comment.new(comment_params)
  end

  helper_method :create_comment

  def new_rating
    @rating = Rating.new
  end

  helper_method :new_rating

  def preset_is_users?(preset)

    preset.user_id == @current_user.id if @current_user.present?
  end

  helper_method :preset_is_users?

  # Never trust parameters from the scary internet, only allow the white list through.
  def preset_params
    params.require(:preset).permit(:name, :user_id, :seeds, :angle, :zoom, :opacity, :color_1, :color_2, :color_3, :color_4, :bg_color, :x, :y, :b1, :b2, :b3, :b4, :b5)
  end

  def comment_params
    params.permit(:comment, :user_id, :preset_id)
  end

end
