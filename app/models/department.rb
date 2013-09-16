class Department < ActiveRecord::Base

  belongs_to :department
  has_many :departments
  has_many :positions
  has_many :premiums


  attr_accessible :name, :department_id

  validates :name, presence: true
  validates :name, uniqueness: true

end
