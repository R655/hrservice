class AddIsMainToEmployeesPrevPositions < ActiveRecord::Migration
  def change
     add_column :employees_prev_positions, :is_main, :boolean, null: :false
  end
end
