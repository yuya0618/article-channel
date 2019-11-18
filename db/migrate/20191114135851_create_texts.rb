class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string    :text,    null: false
      t.references :article, null: false, foreign_key: true
      t.timestamps
    end
  end
end
