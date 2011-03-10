class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.integer :book_no
      t.string  :action
      t.string  :state
      t.references :shipment
      
      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
