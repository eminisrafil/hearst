class ArticlesController < ApplicationController

	def index

	end

	def update
		@article = Article.find(params[:id])
		if params[:vote] = 'plus'
			@article.upvote
		else
			@article.downvote
		end
	end
end
