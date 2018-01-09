class TranslationsController < ApplicationController
  def index
    @indexing = Translation.where(locale: "zh-TW")
    @translates = Translation.all
    @translations = Translation.all
    @groups = Translation.all.group_by(&:key).to_a.first.second
    # @translations = Translation.all.group_by(&:key).to_a.first.second
  end

  def edit
    @translation = Translation.group_by(&:key)
  end

  def update
    translation = Translation.find_by(id: params[:id])
    translation.update(translation_params)
    redirect_to translations_path
  end

  private
  def translation_params
    params.require(:translation).permit(:locale, :key, :value)
  end
end