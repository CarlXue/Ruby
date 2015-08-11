class Exercise_9
  def longest_word(text)
    word_expr = /\w+/
    longest_length = 0
    longest_word = Array.new
    File.open(text, "r+") do |file|
      while line = file.gets
        match_word = word_expr.match(line)
        match_word.each do |word|
          if word.length > longest_length
            longest_word << word
          end
        end
      end
    end
  end
end
