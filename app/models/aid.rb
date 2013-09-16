class Aid < ActiveRecord::Base
  attr_accessible :salary_factor, :salary_add, :employee_id, :name, :accrual_type_id
  belongs_to :accrual_type, :dependent => :restrict
  belongs_to :employee, :dependent => :destroy
  validates :salary_factor, :salary_add, :employee_id, :name, :accrual_type_id, presence: true
  validates :name, uniqueness: true
  validates :name, length: {
      in: 2..20,
      wrong_length: 'Необходимо 2..20 символов в названии'
  }
  validates :salary_factor, numericality: {
      in: 0..1
  }
  validates :salary_add, numericality: {
      greater_than: 0.01
  }

end