class AddUserIdToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :user_id, :integer
  end
end
