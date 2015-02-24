class Story < ActiveRecord::Base
  validates_presence_of :name, :link
  has_many :votes
end