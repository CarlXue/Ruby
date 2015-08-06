class Exercise_5
  def num_regex_matches(expr, string)
    match_result = expr.match(string)
    return match_result.length
  end
end