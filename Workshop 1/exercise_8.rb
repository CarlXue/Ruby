
  def unique_lines(file1, file2)
    file_lines = Array.new
    File.open(file1, "a+") do |file|
      while line = file.gets
        file_lines << line
      end
    end
    File.open(file2, "a+") do |file|
      while line = file.gets
        file_lines << line
      end
    end
    return file_lines.uniq
  end


