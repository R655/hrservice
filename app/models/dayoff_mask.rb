class DayoffMask < ActiveRecord::Base
  attr_accessible :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday
  belongs_to :employee, dependent: :destroy


end
