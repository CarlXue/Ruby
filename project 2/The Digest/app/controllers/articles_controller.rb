

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.reverse
  end
  # GET /interest
  def my_interests
    @articles = Article.tagged_with(current_user.interest_list, :any => true).to_a
    render 'index'
  end
  # GET/ fetch
  def fetchNews
    abc = ABC_Importer.new
    abc.scrape
    eurek = EUREK_Importer.new
    eurek.scrape
    newsau = NEWSAU_Importer.new
    newsau.scrape
    nyt = NYT_Importer.new
    nyt.scrape
    tc = TC_Importer.new
    tc.scrape
    theage = THEAGE_Importer.new
    theage.scrape
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'News was successfully scraped.'}
    end
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @articles = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :source, :summary, :author, :image, :link, :pubDate, :tag_list)
    end
end
