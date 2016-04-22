class DecksController < ApplicationController
  before_action :authenticate!, except: [:show, :index]

  def new
    @deck = Deck.new
    render :new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    if @deck.save
      flash[:notice] = "Deck has been created."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @deck = Deck.includes(:cards).find(params['id'])
    render :show
  end

  def index
    # @decks = User.find(params[:user_id]).decks
    @user = User.find(params['user_id'])
    @decks = @user.decks
    render :index
  end

  def all_decks
    @decks = Deck.all
    render :index
  end

  private
  def deck_params
    params.require(:deck).permit(:title)
  end
end
