class HomeController < ApplicationController
  def showcard
    @cardcheck = current_user.review_pack(params[:id]).cards.randomcard if current_user && current_user.review_pack(params[:id])
    redirect_to welcome_path, notice: t(:No_cards_for_training) unless @cardcheck
  end
end