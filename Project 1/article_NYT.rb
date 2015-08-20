module News
  class Article_NYT < News::Article

    attr_reader :link, :docType, :sectionName, :subsectionName, :wordCount, :header, :footer
    def initialize(author, title, summary, images, source, date, link, docType, sectionName, subsectionName, wordCount, header, footer)    #WITH MORE ATTRIBUTES
      super
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
      # hash = {
      #   'author' => @author,
      #   'title' => @title,
      #   'summary' => @summary,
      #   'images' => @images,
      #   'source' => @source,
      #   'date' => @date,
      super
      hash['link'] = @link
      hash['document_type'] = @docType
      hash['section_name'] = @sectionName
      hash['subsection_name'] = @subsectionName
      hash['word_count'] = @wordCount
      hash['header'] = @header
      hash['footer']= @footer


    end
  end
end
