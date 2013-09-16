class Holiday < ActiveRecord::Base
  attr_accessible :name, :date
  validates :date, :name, :presence => true
  validates :name, uniqueness: true
  validates :date, uniqueness: true
end