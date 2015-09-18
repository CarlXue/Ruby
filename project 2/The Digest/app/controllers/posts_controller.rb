require_relative '../../app/models/abc_importer'
require_relative '../../app/models/eurek_importer'
require_relative '../../app/models/newsau_importer'
require_relative '../../app/models/nyt_importer'
require_relative '../../app/models/tc_importer'
require_relative '../../app/models/theage_importer'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comment]
  before_action :check_auth, only: [:edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.reverse
  end

  def my_interests
    @posts = Post.tagged_with(current_user.interest_list, :any => true).to_a
    render 'index'
  end
  # FETCH
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

    redirect_to posts_path
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # /posts/1/comment
  def comment
    comment = Comment.new(comment_params)
    comment.post = @post
    comment.user = current_user
    respond_to do |format|
      if comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, notice: 'Could not comment.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def check_auth
      # unless @post.can_edit? current_user
      #   redirect_to @post
      # end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :tag_list)
    end
end
