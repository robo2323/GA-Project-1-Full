class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]


  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_back(fallback_location: presets_path, notice: 'rating was sucessefully added') }

      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to :back, notice: 'Rating was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }

    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:rating, :preset_id)
  end
end
