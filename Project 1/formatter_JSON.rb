require 'json'
require_relative 'news.rb'

#   This class is inherited from the Formatter. It requires the native library 
# 'json'.
#   This class is responsible for formatting the json file. 
#   The extension method will return 'JSON', the header? and footer? methods 
# will return true and false respectively. 
#   The header is the content type and character setting. The footer is blank.
#   The article_representation method puts all the keys and attributes of the
# hash together in one hash and generate the json file from that hash.
 
# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class Formatter_JSON < News::Formatter
  #initializer
  def initialize
    super
  end
  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'JSON'
  end
  #CHECK WHETHER THERE IS A HEADER
  def header?
    true
  end
  #CHECK WHETHER THERE IS A FOOTER
  def footer?
    false
  end

  #PRESENT THE HEADER
  def header(article)
    if header?
      return 'Content-type: application/json, charset=UTF-8'
    end
  end
  #PRESENT THE FOOTER
  def footer(article)
    if footer?
      return
    end
  end
  #PRESENT THE ARTICLE
  def article_representation(article)
    my_json = {}
    article.attributes.each do |key, value|
      my_json[key.to_sym] = value.to_s
    end
    return JSON.generate(my_json)
  end

end