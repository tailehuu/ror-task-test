class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :service_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
