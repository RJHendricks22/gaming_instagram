class AddGameToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :game, :string
  end
end
