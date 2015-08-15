
  def longest_word(text)
    word_expr = /\w+/
    longest_length = 0
    longest_word = ''
    File.open(text, 'r+') do |file|
      while line = file.gets
        line.scan(word_expr).each do |word|
          if word.length > longest_length
            longest_word = word
            longest_length = word.length
          end
        end
      end
    end
    longest_word
  end
