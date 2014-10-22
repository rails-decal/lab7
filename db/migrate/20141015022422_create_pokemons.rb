class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :level
      t.text :description

      t.timestamps
    end
  end
end
