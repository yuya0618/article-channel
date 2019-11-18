class CreateHeads < ActiveRecord::Migration[5.2]
  def change
    create_table :heads do |t|
      t.string    :head,    null: false
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
  end
end
