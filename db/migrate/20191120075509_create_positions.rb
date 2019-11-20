class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :position
      t.references :head,     foreign_key: true
      t.references :text,     foreign_key: true
      t.references :relation, foreign_key: true
      t.references :article,  foreign_key: true
      t.timestamps
    end
  end
end
