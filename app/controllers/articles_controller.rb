class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # CSRF保護を無効
  protect_from_forgery except:[:update]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    # binding.pry
    @heads = @article.heads
    @texts = @article.texts
    @relations = @article.relations
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json
      else
        format.html { render :new }
        format.json
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    # binding.pry
    @article.update(article_params)
    render body: nil
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def head_sort
    # binding.pry
    position = Position.find(params.require(:head)[:id])
    position.update(position: head_position_params[:position_position])
    render body: nil
  end

  def text_sort
    # binding.pry
    position = Position.find(params.require(:text)[:id])
    position.update(position: text_position_params[:position_position])
    render body: nil
  end

  def relation_sort
    # binding.pry
    position = Position.find(params.require(:relation)[:id])
    position.update(position: relation_position_params[:position_position])
    render body: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.permit(:title,:explanation)
    end

    def head_position_params
      params.require(:head).permit(:position_position)
    end

    def text_position_params
      params.require(:text).permit(:position_position)
    end

    def relation_position_params
      params.require(:relation).permit(:position_position)
    end
end
