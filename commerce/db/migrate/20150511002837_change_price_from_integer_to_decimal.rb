class ChangePriceFromIntegerToDecimal < ActiveRecord::Migration
  def change
    remove_column :items, :price
    add_column :items, :price, :decimal, :precision => 10, :scale => 2
  end
end
