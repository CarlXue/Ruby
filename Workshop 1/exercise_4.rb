  def regex_sentence(string)
    expr_sentence = /^[A-Z][a-z ,]*[\.\?!]$/
    string =~expr_sentence ? :true : :false
  end

  def regex_phone(string)
    expr_phone = /^\(?((0|\+61)(2|4|3|7|8))?\)?( |-)?[0-9]{2}( |-)?[0-9]{2}( |-)?[0-9]( |-)?[0-9]{3}$/
    string=~ expr_phone ? :true : :false
  end

  def regex_email(string)
    expr_email = /[a-z0-9._%+-]+@([a-z0-9]+)\.[a-z]{2,4}/
    string =~ expr_email ? :true : :false
  end
