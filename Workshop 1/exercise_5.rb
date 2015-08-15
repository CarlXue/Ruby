class Exercise_5
  def num_regex_matches(expr, string)
    string.scan(expr).count
  end
end