class Story < ActiveRecord::Base
  validates_presence_of :name, :link
  has_many :votes
  
  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
  
end