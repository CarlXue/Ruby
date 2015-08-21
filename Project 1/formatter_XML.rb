require 'Date'
require 'builder'
require_relative 'news.rb'

class Formatter_XML < News::Formatter
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

    xml.article do
      my_hash.each do | key, value |
        xml.article( value, :attr => key )
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