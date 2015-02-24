class User < ActiveRecord::Base
  has_many :stories
  has_many :votes
  has_many :stories_voted_on,
      :through => :votes,
      :source => :story
  def to_param
    "#{id}-#{login}"
  end
  
end