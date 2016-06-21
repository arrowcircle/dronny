class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :title
      t.string :logo
      t.string :site

      t.timestamps
    end
  end
end
