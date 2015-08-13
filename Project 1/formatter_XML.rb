require 'Date'
require_relative 'news.rb'

class Formatter_XML < News::Formatter
  attr_reader :extension, :header, :footer, :article_representation
  #initializer
  def initialize(extension, header, footer)
    super()
    @extension = extension
    @header = header
    @footer = footer
    @article_representation = nil
  end
  #essential methods
  #DEFINE THE OUTPUT FORMAT
  def extension
    return 'XML'
  end
  #CHECK WHETHER THERE IS A HEADER
  def header?
    if (@header.nil?)
      return true
    else
      return false
    end
  end
  #CHECK WHETHER THERE IS A FOOTER
  def footer?
    if (@footer.nil?)
      return true
    else
      return false
    end
  end

  #PRESENT THE HEADER
  def header(article)
    if header?
      return @header    #Line break
    end
  end
  #PRESENT THE FOOTER
  def footer(article)
    if footer?
      return @footer  #Line break
    end
  end
  #PRESENT THE ARTICLE
  def article_representation(article)
    _author = article.author
    _title = article.title
    _summary = article.summary
    _images = article.images
    _source = article.source
    _date = article.date
    @article_representation = 'Article\'s author is %s, title is %s, summary is %s, images include %s, source is from %s, date is %s' % [_author, _title, _summary, _images, _source, _date]
    return @article_representation
  end

end