class TranslationsController < ApplicationController
  def index
    @translations = Translation.all
  end

  def edit
    @translation = Translation.all.group_by(&key)
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