class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except:[:destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end

  # GET /texts/new
  def new
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)
    @article = Article.find(params[:article_id])
    if @text.save
      # text作成時にそのidに紐付いたpositionも作成する
      @position = Position.new(text_id:@text.id, article_id:@article.id)
      @position.save
      render 'text.js.erb'
    else
      redirect_to article_path(params[:article_id])
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    if @text.destroy
      render "text-delete.js.erb"
    else
      redirect_to article_path(params[:article_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.permit(:text).merge(article_id:params[:article_id])
    end
end
