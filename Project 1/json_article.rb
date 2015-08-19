class JSON_Article < News::Article
  attr_accessor :header_info, :footer_info
  def initialize(header: ,footer: )
    super
  end
end