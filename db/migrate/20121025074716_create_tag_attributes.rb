class CreateTagAttributes < ActiveRecord::Migration
  def change
    create_table :tag_attributes do |t|
      t.string :key
      t.string :name

      t.timestamps
    end
  end
end
