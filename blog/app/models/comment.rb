class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :commenter
  
  validates_presence_of :commenter
  validates_presence_of :body
  
end
