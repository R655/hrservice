class Constants < ActiveRecord::Base

  attr_accessible :name, :value
  def self.payday
    Constants.where(name: 'payday').first || 23
  end 
end