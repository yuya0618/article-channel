class AddRelationToRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :relations, :relation, :integer
  end
end
