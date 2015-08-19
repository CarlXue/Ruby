require 'Date'
require_relative 'news.rb'

class Formatter_CSV < News::Formatter
  attr_reader :extension, :header, :footer, :article_representation
  #initializer
  def initialize()
    super()
    # @extension = extension
    # @header = header
    # @footer = footer
    # @article_representation = nil
  end
  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'CSV'
  end
  #CHECK WHETHER THERE IS A HEADER
  def header?
    # if (@header.nil?)
    #   return true
    # else
    #   return false
    # end
    true
  end
  #CHECK WHETHER THERE IS A FOOTER
  def footer?
    # if (@footer.nil?)
    #   return true
    # else
    #   return false
    # end
    false
  end

  #PRESENT THE HEADER
  def header(article)
    if header?
      return article.attributes.keys.join(' ,')    #Line break
    end
  end
  #PRESENT THE FOOTER
  # def footer(article)
  #   if footer?
  #   #   return footer  #Line break
  #   end
  # end
  #PRESENT THE ARTICLE
  def article_representation(article)
    return article.attributes.values.map(&:to_s).join(' ,')
  end
end