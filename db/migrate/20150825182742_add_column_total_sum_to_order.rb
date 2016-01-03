class AddColumnTotalSumToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_sum, :decimal, precision: 15, scale: 2, default: 0
  end
end
