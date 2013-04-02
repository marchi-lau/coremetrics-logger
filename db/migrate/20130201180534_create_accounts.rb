class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :company_id
      t.integer :client_id
      t.string :name
      t.text :api_key

      t.timestamps
    end
  end
end
