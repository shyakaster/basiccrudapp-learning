class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end
    def create
       @article= Article.new(article_params)

       if @article.save
        redirect_to @article
       else
        /We use the render  method so that the @article object is rendered back to the new form redirecto would have done a refresh/
        render 'new'
       end
    end

    def show
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to articles_path
        else
            
            #You notice that we use the render method here again 
            #because we want to render the @article object back to 
            #the form

            render 'edit'
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
