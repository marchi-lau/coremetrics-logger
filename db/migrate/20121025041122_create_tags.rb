class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.text :parameters

      t.timestamps
    end
  end
end
