class Exercise_8
  def unique_lines(file1, file2)
    unique_lines = Array.new
    file1_lines = Array.new
    File.open(file1, "a+") do |file|
      while line = file.gets
        file1_lines << line
      end
    end
    File.open(file2, "a+") do |file|
      i = 0
      while line = file.gets
        if line.eql?(file1_lines[i])
          unique_lines << line
        end
        i = i + 1
      end
    end
    return unique_lines
  end
end