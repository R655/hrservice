class Position < ActiveRecord::Base
  belongs_to :department # если это включить то сайт не работает

  attr_accessible :name, :department_id, :salary

  after_save :modify_history

  validates :name, presence: true, uniqueness: true

  validates :salary, numericality: {
      greater_than: 0.01
  }

  def modify_history
    nil
  end
end
