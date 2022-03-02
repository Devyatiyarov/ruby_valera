class InputMock
  def initialize(return_value)
    @return_value = return_value
  end

  def key
    @return_value
  end
end
