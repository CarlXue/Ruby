require 'builder'
require_relative 'news.rb'

#   This class is inherited from the Formatter. It requires the native library 
# 'builder'.
#   This class is responsible for formatting the xml file. 
#   The extension method will return 'XML', the header? and footer? methods will
# return true and false respectively. 
#   The header is the XML version and encoding information. The footer is blank.
#   The article_representation method builds the xml with the keys and
# attributes in the article hash.
 
# Created by Song Xue (667692)
# Engineering and IT school, University of Melbourne

class Formatter_XML < News::Formatter
  attr_reader :extension, :header, :footer, :article_representation
  #initializ
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
    return 'XML'
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
      return '<?xml version="1.1" encoding="US-ASCII"?>'
    end
  end
  #PRESENT THE FOOTER
  def footer(article)
    if footer?
      return
    end
  end
  #PRODUCE XML FROM A HASH
  def produce_xml (my_hash)
    xml = Builder::XmlMarkup.new( :indent => 2 )

    xml.instruct! :xml, :version => "1.1", :encoding => "US-ASCII"

    xml.docs do
      my_hash.each do | key, value |
        xml.attr(key,value)
      end
    end
  end
  #PRESENT THE ARTICLE
  def article_representation(article)
    articles = {}
    article.attributes.each do |key, value|
      articles[key.to_sym] = value.to_s
    end
    produce_xml (articles)
  end

end