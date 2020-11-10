class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.references :tlist, foreign_key: true

      t.timestamps
    end
  end
end
