class AccrualType < ActiveRecord::Base
  has_many :aids # , dependent: :restrict # FIXME изза депендент перестаёт работать круд
  has_many :premia
  
  attr_accessible :name, :start_month, :months_period
  validates :name, :start_month, :months_period, :presence => true
  validates :name, uniqueness: true
  validates :name, length: {
      in: 2..20,
      wrong_length: 'Need 2 - 20 sy,bols in name'
  }
  validates :start_month, :months_period, numericality: {
      only_integer: true,
      in: 1..12
      # TODO validate start_month + months_period < 12
  }
end