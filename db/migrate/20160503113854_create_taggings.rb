class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :taggable, polymorphic: true, index: true
      t.references :tag

      t.timestamps
    end
    add_index :taggings,
              [:tag_id, :taggable_id, :taggable_type],
              unique: true, name: 'taggings_idx'
  end
end
