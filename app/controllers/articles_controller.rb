class ArticlesController < ApplicationController

	before_filter :authenticate_user!
	require 'json'

	def index

	end

  def fetch
    @json = HTTParty.get("http://hearst.api.mashery.com/ArticleImage/search?_pretty=1&shape=full&limit=10&sort=name%2Casc&total=0&api_key=t8bp4fzvk9eqq4jrbppwgg2t").response.body  #.map(&: default_url)#.first
   	@json = JSON.parse @json 
   	@json = @json['items'].map do |t|
   		{ :url => t['default_url'] }
   	end

    respond_to do |format|
      format.html { render json: @json }
      format.json { render json: @json.to_json }
    end
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
