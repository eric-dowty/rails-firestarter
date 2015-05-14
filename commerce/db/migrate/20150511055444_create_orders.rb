class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :status, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
