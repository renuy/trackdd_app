class CreateShipments < ActiveRecord::Migration
  def self.up
    create_table :shipments do |t|
      t.integer :origin_id
      t.string  :destination
      t.string  :card_id
      t.string  :action
      t.string  :state
      t.string  :special_instr
      t.timestamps
    end
  end

  def self.down
    drop_table :shipments
  end
end
