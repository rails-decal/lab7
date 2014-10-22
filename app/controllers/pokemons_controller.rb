class PokemonsController < ApplicationController
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
