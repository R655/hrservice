class Aid < ActiveRecord::Base
  attr_accessible :salary_factor, :salary_add, :employee_id, :name, :accrual_type_id
  belongs_to :accrual_type # :dependent => :restrict # круд перестаёт работать изза депендента
  belongs_to :employee
  validates :salary_factor, :salary_add, :employee_id, :name, :accrual_type_id, presence: true
  validates :name, uniqueness: true
  validates :name, length: {
      in: 2..20,
      wrong_length: 'Need 2 - 20 symbols'
  }
  validates :salary_factor, numericality: {
      in: 0..1
  }
  validates :salary_add, numericality: {
      greater_than: 0.01
  }
  delegate :start_month, to: :accrual_type
  delegate :months_period, to: :accrual_type
  
end