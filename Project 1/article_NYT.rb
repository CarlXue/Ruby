module News
  class Article_NYT < News::Article

    attr_reader :link, :docType, :sectionName, :subsectionName, :wordCount, :header, :footer
    def initialize(author, title, summary, images, source, date, link, docType, sectionName, subsectionName, wordCount, header, footer)    #WITH MORE ATTRIBUTES
      super(author, title, summary, images, source, date)
      @link = link
      @docType = docType
      @sectionName = sectionName
      @subsectionName = subsectionName
      @wordCount = wordCount
      @header = header
      @footer = footer
    end
    #RETURN ALL THE ATTRIBUTES AS A HASH
    def attributes
      hash = {
        'author' => @author,
        'title' => @title,
        'summary' => @summary,
        'images' => @images,
        'source' => @source,
        'date' => @date,
        'link' => @link,
        'document_type' => @docType,
        'section_name' => @sectionName,
        'subsection_name' => @subsectionName,
        'word_count' => @wordCount,
        'header' => @header,
        'footer'=> @footer
      }
    end
  end
end
