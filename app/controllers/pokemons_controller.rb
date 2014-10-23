class PokemonsController < ApplicationController

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemons_path
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      render "new"
    end
  end

  def index
    @pokemons = Pokemon.all
  end

  def edit
    @pokemon = Pokemon.find params[:id]
  end

  def update
    @pokemon = Pokemon.find params[:id]
    @pokemon.update(pokemon_params)
    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :level, :user_id)
  end
end
