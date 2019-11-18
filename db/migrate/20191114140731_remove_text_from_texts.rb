class RemoveTextFromTexts < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :text, :string
    add_column :texts, :text, :text
  end
end
