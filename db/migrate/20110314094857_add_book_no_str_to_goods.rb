class AddBookNoStrToGoods < ActiveRecord::Migration
  def self.up
    add_column :goods, :book_no_str, :string
  end

  def self.down
    remove_columnd :goods, :book_no_str
  end
end
