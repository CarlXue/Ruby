require 'Date'
require 'json'
require_relative 'news.rb'

class Formatter_JSON < News::Formatter
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
    return 'JSON'
  end
  #CHECK WHETHER THERE IS A HEADER
  def header?
    # if (@header.nil?)
    #   return true
    # else
    #   return false
    # end
  end
  #CHECK WHETHER THERE IS A FOOTER
  def footer?
    # if (@footer.nil?)
    #   return true
    # else
    #   return false
    # end
  end

  #PRESENT THE HEADER
  def header(article)
    # if header?
    #   return @header    #Line break
    # end
  end
  #PRESENT THE FOOTER
  def footer(article)
    # if footer?
    #   return @footer  #Line break
    # end
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