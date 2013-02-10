class Article < ActiveRecord::Base

	has_many :tags
  attr_accessible :address, :positive, :negative


  def self.upvote
  	self.positive = self.positive + 1
  	self.save
  end

  def self.downvote
  	self.negative = self.negative + 1
  	self.save
  end

end
