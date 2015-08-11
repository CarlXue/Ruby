class Exercise_7
  def count_lines(file)
    line_counter = 0
    File.open(file, "r") do |file|
      while line = file.gets
        line_counter += 1
      end
      return line_counter
    end
  end
end