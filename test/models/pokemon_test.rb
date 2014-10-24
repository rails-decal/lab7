require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  test "should not save without name" do
    pokemon = Pokemon.new
    assert_not pokemon.save, "Saved a Pokemon without a name"
  end
  test "should not save if name not unique" do
      pokemon = Pokemon.new(name: "Pokemon 1", level: 1, user_id: 1)
      assert_not pokemon.save, "Saved a Pokemon with non-unique title"
  end
end
