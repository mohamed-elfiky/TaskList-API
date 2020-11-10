class CreateTlists < ActiveRecord::Migration[5.2]
  def change
    create_table :tlists do |t|
      t.string :name
      t.string :owner

      t.timestamps
    end
  end
end
