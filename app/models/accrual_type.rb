class AccrualType < ActiveRecord::Base
  has_many :aids, dependent: :restrict
  attr_accessible :name, :start_month, :months_period
  validates :name, :start_month, :months_period, :presence => true
  validates :name, uniqueness: true
  validates :name, length: {
      in: 2..20,
      wrong_length: 'Необходимо 2..20 символов в названии'
  }
  validates :start_month, :months_period, numericality: {
      only_integer: true,
      in: 1..12
      # TODO validate start_month + months_period < 12
  }
end