class Holiday < ActiveRecord::Base
  attr_accessible :name, :date
  validates :date, :name, :presence => true
  validates :name, uniqueness: true
  validates :date, uniqueness: true
  
  def start_date
    date
  end

  def end_date
    date
  end
  
  def salary_factor
    1.0
  end
  
end