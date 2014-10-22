class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :num_badges

      t.timestamps
    end
  end
end
