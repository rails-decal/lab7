require 'test_helper'

class PokemonsControllerTest < ActionController::TestCase
  setup do
    @pokemon = pokemons(:pokemon_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pokemons)
    assert_equal Pokemon.count, assigns(:pokemons).size
  end

  test "should get edit" do
    get :edit, id: @pokemon
    assert_response :success
  end

  test "should update pokemon name" do
    patch :update, id: @pokemon, pokemon: {name: @pokemon.name}
    assert_redirected_to pokemons_path
  end
end
