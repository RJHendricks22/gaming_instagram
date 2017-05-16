class CreatePictuers < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :source
      t.references :user, foreign_key: true
      t.integer :likes

      t.timestamps
    end
  end
end
