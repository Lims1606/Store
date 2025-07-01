class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    respond_for_article(@article.save, "created", :created)
  end

  def update
    respond_for_article(@article.update(article_params), "updated", :ok)
  end

  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :title, :description)
  end

  def respond_for_article(success, html_action, success_status)
    respond_to do |format|
      if success
        format.html { redirect_to @article, notice: "Article was successfully #{html_action}." }
        format.json { render :show, status: success_status, location: @article }
      else
        view = html_action == "created" ? :new : :edit
        format.html { render view, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
end
