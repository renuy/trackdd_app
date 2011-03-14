class AddChangeAddrToShipment < ActiveRecord::Migration
  def self.up
    add_column :shipments, :change_addr, :string
  end

  def self.down
        remove_column :shipments, :change_addr

  end
end
