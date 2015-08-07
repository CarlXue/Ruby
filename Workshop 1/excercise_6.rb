class Excercise_6
  def call_block(block)
    if block_given?
      yield(block)
    else
      return :no_block_provided
    end
  end
end