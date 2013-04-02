class FixTagIdColumnName < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.rename :tag_id, :tid
    end
    change_table :tag_types do |t|
      t.rename :tag_id, :tid
    end
    
  end

end
