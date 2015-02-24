class Story < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :link
  has_many :votes do
    def latest
      find :all, :order => 'id DESC', :limit => 3
    end
  end
  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end