class CreateBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :builds do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :status, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
