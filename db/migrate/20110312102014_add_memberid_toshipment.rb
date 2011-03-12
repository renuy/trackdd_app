class AddMemberidToshipment < ActiveRecord::Migration
  def self.up
    add_column :shipments, :membership_id, :integer
  end

  def self.down
    remove_column :shipments, :membership_id
  end
end
