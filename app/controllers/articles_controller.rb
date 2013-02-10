class ArticlesController < ApplicationController

	def index

	end

	def show

	end

	def update
		article = Article.find(params[:id])
		if params[:vote] = 'plus'
			article.upvote
		else
			article.downvote
		end
		next_article = Article.random
		redirect_to show_article(next_article) 
	end

end
