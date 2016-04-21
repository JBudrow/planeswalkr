class DeckCardsController < ApplicationController
  def index
    @deck_card = DeckCard.find_by!(name: params["name"])
    @decks = @deck_card.decks
    render :index
  end
end
