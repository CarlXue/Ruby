class Exercise_4

  def regex_sentence(string)
    expr_sentence = /^\\s+[A-Za-z,;'\"\\s]+[.?!]$/
    if expr.match(string)
      return true
    else
      return false
    end
  end

  def regex_phone(string)
    expr_phone = /^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$/
    if expr.match(string)
      return true
    else
      return false
    end
  end

  def regex_email(string)
    expr_email = /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/
    if expr.match(string)
      return true
    else
      return false
    end
  end

end