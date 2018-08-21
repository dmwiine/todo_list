class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.references :todo, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
