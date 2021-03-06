class RelationsController < ApplicationController
  before_action :set_relation, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except:[:destroy]

  # GET /relations
  # GET /relations.json
  def index
    @relations = Relation.all
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
  end

  # GET /relations/new
  def new
    @relation = Relation.new
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.new(relation_params)
    @article = Article.find(params[:article_id])
    if @relation.save
      # relation作成時にそのidに紐付いたpositionも作成する
      @position = Position.new(relation_id:@relation.id, article_id:@article.id)
      @position.save
      render 'relation.js.erb'
    else
      redirect_to article_path(params[:article_id])
    end
  end

  # PATCH/PUT /relations/1
  # PATCH/PUT /relations/1.json
  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to @relation, notice: 'Relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    if @relation.destroy
      render "relation-delete.js.erb"
    else
      redirect_to article_path(params[:article_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.permit(:relation).merge(article_id:params[:article_id])
    end
end
