class HeadsController < ApplicationController
  before_action :set_head, only: [:show, :edit, :update, :destroy]
  # CSRF保護を無効
  protect_from_forgery except:[:destroy]

  def index
    @heads = Head.all
  end

  def show
  end

  def new
    @head = Head.new
  end

  def edit
  end

  def create
    # binding.pry
    @head = Head.new(head_params)
    @article = Article.find(params[:article_id])
    if @head.save
      # head作成時にそのidに紐付いたpositionも作成する
      @position = Position.new(head_id:@head.id, article_id:@article.id)
      # binding.pry
      @position.save
      render 'head.js.erb'
    else
      redirect_to article_path(params[:article_id])
    end
  end

  def update
    respond_to do |format|
      if @head.update(head_params)
        format.html { redirect_to @head, notice: 'Head was successfully updated.' }
        format.json { render :show, status: :ok, location: @head }
      else
        format.html { render :edit }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    render "head-delete.js.erb"
    @head.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head
      @head = Head.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def head_params
      params.permit(:head).merge(article_id:params[:article_id])
    end
end
