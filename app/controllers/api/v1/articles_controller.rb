module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC');
                render json: {status: 'SUCCESS', massage:'Loaded articles', data:articles},status: :ok
            end
            def show
                article = Article.find(params[:id])
                render json: {status: 'SUCCESS', massage:'Loaded article', data:article},status: :ok
            end
            def create
                article = Article.new(article_params)
                if article.save
                    render json: {status: 'SUCCESS', massage:'Loaded saved', data:article},status: :ok
                else
                    render json: {status: 'ERROR', massage:'Loaded not saved', data:article.erors},status: :unprocessable_entity
                end
            end
            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {status: 'SUCCESS', massage:'Delete Article', data:article},status: :ok
            end
            def update
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                    render json: {status: 'SUCCESS', massage:'Article Updated', data:article},status: :ok
                else
                    render json: {status: 'ERROR', massage:'Article Not Updated', data:article.erors},status: :unprocessable_entity
                end
            end
            private
            def article_params
                params.permit(:title, :body)
            end
        end
    end
end