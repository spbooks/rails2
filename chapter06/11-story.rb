class Story < ActiveRecord::Base
  validates_presence_of :name, :link
end