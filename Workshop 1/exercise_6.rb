class Exercise_6
  def call_block
    if block_given?
      yield
    else
      return :no_block_provided
    end
  end
end