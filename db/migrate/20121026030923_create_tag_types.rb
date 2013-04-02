class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :name
      t.integer :tag_id

      t.timestamps
    end
  end
end
