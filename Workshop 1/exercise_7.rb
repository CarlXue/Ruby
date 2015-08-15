
  def count_lines(file)
    line_counter = 0
    File.open(file, "r") do |file|
      while line = file.gets
        line_counter += 1
      end
      line_counter
    end
  end




