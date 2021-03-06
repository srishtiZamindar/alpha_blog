class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    #grab all articles
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create 
    #render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    
    #@article.save
    #redirect_to articles_path(@article)
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
        flash[:notice] = "Article successfully updated!"
        redirect_to article_path(@article)
    else
        render 'new'   #opens the edit page again
    end
  end

  def show 
    #@article = Article.find(params[:id])
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private

    def set_article
      #removed from edit, update, show and destroy
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end