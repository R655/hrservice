class Constants < ActiveRecord::Base

  attr_accessible :name, :value
  def self.payday
    Constants.first(name: 'payday').first || 23
  end 
end