class Employees  < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Employee"
  end
end