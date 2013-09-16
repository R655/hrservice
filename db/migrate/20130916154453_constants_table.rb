class ConstantsTable < ActiveRecord::Migration
  
  def change
    create_table "constants", :force => true do |t|
      t.string  "name",            :limit => 30, :unique => true, :null => false      
      t.float   "value",           :null => false
    end
    
    add_index :constants, :name, :unique => true
    # add main constants to table later
     
  end
  
end
