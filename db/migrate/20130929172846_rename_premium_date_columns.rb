class RenamePremiumDateColumns < ActiveRecord::Migration
  def change
    rename_column :premia, :start_month, :start_date
    rename_column :premia, :end_month, :end_date
  end

end
