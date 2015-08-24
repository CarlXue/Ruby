require_relative 'news.rb'

#   This class is inherited from the Formatter.
#   This class is responsible for formatting the csv file. 
#   The extension method will return 'CSV', the header? and footer? methods will 
# return true and false respectively. 
#   The header is all the keys in the article hash. The footer is blank.
#   The article_representation method puts all the attributes of the hash 
# together with a ',' in between.

# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class Formatter_CSV < News::Formatter
  #initializer
  def initialize
    super
  end

  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'CSV'
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
      return article.attributes.keys.join(' ,')
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
    return article.attributes.values.map(&:to_s).join(",")
  end
end